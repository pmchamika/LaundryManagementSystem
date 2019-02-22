package com.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.concurrent.TimeUnit;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DBconnect.ConnectionMySql;
import com.Models.Order;

/**
 * Servlet implementation class OrderStatusServlet
 * 
 * @author Maneesha
 */
@WebServlet("/OrderStatusServlet")
public class OrderStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderStatusServlet() {
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
		if((session.getAttribute("E_NIC")!=null)||(session.getAttribute("C_NIC")!=null)){
			/*Works only  when employee or customer logged in*/
			
			Order order=new Order();
			/*set the reciept no to setters */
			order.setRecieptNo(request.getParameter("receiptno"));
			
			try {	/*calling the mysql connection class*/
					ConnectionMySql db=new ConnectionMySql();
					Connection conn=db.getCon();
					
					/*get the reciept no from getters */
			        String receiptno=order.getRecieptNo();
			        
			        String query = "select count(O_ID),O_Date,C_NIC,O_Payment FROM LaundryOrder Where O_ID='"+receiptno+"'";
			        Statement stmt= conn.createStatement();
			        ResultSet r=stmt.executeQuery(query);
			        
			        while(r.next()){
			        	
			        	int i=r.getInt("count(O_ID)");
			        	if(i==1) {
			        		/*when no of orders equal to one*/
					        String date1=r.getString("O_Date");
					        String nic=r.getString("C_NIC");
					        String payment=r.getString("O_Payment");
					        
					        /*get the date difference between current date and date stored in the order table*/
					        SimpleDateFormat sdf=new SimpleDateFormat("dd/MM/yyyy");
				        	Calendar c=Calendar.getInstance();
				        	c.setTime(new Date());
				        	String date2=sdf.format(c.getTime());
				        	
				        	Date d1 = sdf.parse(date1);
				            Date d2 = sdf.parse(date2);
				            long diff = d1.getTime() - d2.getTime();
				            long days=TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS);
				            
				            if(days<=0) {
				            	/*when no of days equal or less than to zero*/
				            	request.setAttribute("ID", receiptno);
				 	            request.setAttribute("NIC", nic);
				 	            request.setAttribute("Payment", payment);
				            	request.setAttribute("Days", "Completed");
						        RequestDispatcher rd= request.getRequestDispatcher("OrderStatus.jsp");
						        rd.forward(request, response);
				            }
				            
				            else {
					            String diffdays = new Long(days).toString();
					            System.out.println ("Days: " +diffdays);
					            
					            request.setAttribute("ID", receiptno);
					            request.setAttribute("NIC", nic);
					            request.setAttribute("Payment", payment);
					            request.setAttribute("Days", diffdays);
						        RequestDispatcher rd= request.getRequestDispatcher("OrderStatus.jsp");
						        rd.forward(request, response);
				            }
			        	}else{
			        		RequestDispatcher rd= request.getRequestDispatcher("OrderStatus.jsp");
			        		rd.forward(request, response);
			        	}
			            
			        }
			} catch (Exception e) {
			       System.err.println(e);
			    }
		   
		}else {
			/*Works only  when employee or customer isn't logged in*/
			response.sendRedirect("Login.jsp");
		}
	}

}
