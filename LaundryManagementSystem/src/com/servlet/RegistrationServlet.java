package com.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DBconnect.ConnectionMySql;
import com.Models.Customer;

/**
 * Servlet implementation class RegistrationServlet
 * 
 * @author Maneesha
 */
@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrationServlet() {
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
		Customer customer=new Customer();
		
		/*set all the customer details to setters */
		customer.setFullName(request.getParameter("fullname"));
		customer.setGender(request.getParameter("gender"));
		customer.setAddress(request.getParameter("address"));
		customer.setNIC(request.getParameter("nic"));
		customer.setContact(request.getParameter("contact"));
		customer.setPassword(request.getParameter("password"));
		
		try {	/*calling the mysql connection class*/
				ConnectionMySql db=new ConnectionMySql();
				Connection conn=db.getCon();
		        
						/*get all the customer details from the getters */
		        		String name=customer.getFullName();	
		   				String gender=customer.getGender();	
		   				String address=customer.getAddress();
		   				String nic=customer.getNIC();	
		   				String contact=customer.getContact();	
		   				String password=customer.getPassword();
		   				
		   				String query1="select count(C_ID) from Customer where C_NIC='"+nic+"'";
						Statement stmt1= conn.createStatement();
				        ResultSet r=stmt1.executeQuery(query1);
				        while(r.next()){
					        int i1=r.getInt("count(C_ID)");
					        
					        if(i1==0){
					        	/*when no of customers equal to zero*/
						        String query2 = "insert into Customer(C_FullName,C_Gender,C_Address,C_NIC,C_Phone,C_Password) values ('"+name+"','"+gender+"','"+address+"','"+nic+"','"+contact+"','"+password+"')";
						        Statement stmt2= conn.createStatement();
						        int i2=stmt2.executeUpdate(query2);
						        
							        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/Home.jsp");
						            requestDispatcher.forward(request, response);
					        }else {
					        	/*when no of customers is not equal to zero*/
					        	String msg="Duplicate";
					        	HttpSession session=request.getSession();
					        	session.setAttribute("MSG1",msg);
					        	System.out.println("Duplicate NIC");
					        	RequestDispatcher requestDispatcher = request.getRequestDispatcher("/Registration.jsp");
					            requestDispatcher.forward(request, response);
					        }
				        }
			        } catch (Exception e) {
					       System.err.println(e);
					    }
				   
		
	}

}
