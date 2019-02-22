package com.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Calculations.Calculate;
import com.Calculations.CalculatePayment;
import com.Calculations.CalculateSalary;
import com.DBconnect.ConnectionMySql;
import com.Models.Employee;
import com.Models.Order;

/**
 * Servlet implementation class AddOrderServlet
 * @author Oshadi
 */
@WebServlet("/AddOrderServlet")
public class AddOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddOrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		if(session.getAttribute("E_NIC")!=null){
			/*Works only  when Employee logged in*/
			
			Order order=new Order();
			/*set all the order details to setters */
			order.setNIC(request.getParameter("nic"));
			order.setWeight(request.getParameter("weight"));
			order.setRate(request.getParameter("rate"));
			
			try {	/*calling the mysql connection class*/
					ConnectionMySql db=new ConnectionMySql();
					Connection conn=db.getCon();
					
					/*get all the order details through getters */
			        String nic=order.getNIC();	
					String weight=order.getWeight();
					String rate=order.getRate();
					
					String query1="select count(C_ID) from Customer where C_NIC='"+nic+"'";
					Statement stmt1= conn.createStatement();
			        ResultSet r=stmt1.executeQuery(query1);
			        while(r.next()){
				        int i1=r.getInt("count(C_ID)");
				        
					        if(i1==1){
					        	/*when no of customers equal to one*/
					        	double rte=Double.parseDouble(rate);
					        	double wei = Double.parseDouble(weight);
					        	Calculate cal=new CalculatePayment(rte,wei);
						        double payment=cal.Calculation();
					        	String fullpayment = String.valueOf(payment);
					        	
					        	/*Add 3 days to current date*/
					        	SimpleDateFormat sdf=new SimpleDateFormat("dd/MM/yyyy");
					        	Calendar c=Calendar.getInstance();
					        	c.setTime(new Date());
					        	c.add(Calendar.DATE,3);
					        	String date=sdf.format(c.getTime());
					        	System.out.println(date);		
					        	
						        String query2 = "insert into LaundryOrder(O_Weight,O_Date,O_Payment,C_NIC,E_NIC) values ('"+weight+"','"+date+"','"+payment+"','"+nic+"','"+session.getAttribute("E_NIC")+"')";
						        Statement stmt2= conn.createStatement();
						        int i2=stmt2.executeUpdate(query2);
						       
						        String query3 = "select * from LaundryOrder where O_Weight='"+weight+"' AND O_Date='"+date+"' AND O_Payment='"+payment+"' AND C_NIC='"+nic+"' AND E_NIC='"+session.getAttribute("E_NIC")+"' ";
						        Statement stmt3= conn.createStatement();
						        ResultSet r3=stmt3.executeQuery(query3);
					        
							        while(r3.next()){
							        	String id=r3.getString("O_ID");
							        	System.out.println(id);
							        	
							        	request.setAttribute("NIC",nic);
							        	request.setAttribute("RecieptId",id);
							        	request.setAttribute("Date",date);
							        	request.setAttribute("Payment",fullpayment);
								        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/ShowOrder.jsp");
							            requestDispatcher.forward(request, response);
							        }
					        }else {
					        	/*when no of customers isn't equal to one*/
					        	String msg="Unregistered";
					        	session.setAttribute("MSG3",msg);
					        	System.out.println("Unregistered Customer");
					        	RequestDispatcher requestDispatcher = request.getRequestDispatcher("/AddOrder.jsp");
					            requestDispatcher.forward(request, response);
					        }
				        }	
		        
			} catch (Exception e) {
			       System.err.println(e);
			    }
		   
		}else {
			/*when employee isn't logged in */
			response.sendRedirect("Login.jsp");
		}
		
	}

}
