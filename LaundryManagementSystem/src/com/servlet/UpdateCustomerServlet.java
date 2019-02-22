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
import com.Models.Employee;

/**
 * Servlet implementation class UpdateCustomerServlet
 * 
 * @author Maneesha
 */
@WebServlet("/UpdateCustomerServlet")
public class UpdateCustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCustomerServlet() {
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
			/*Works only when Employee logged in*/
			
			Customer customer=new Customer();
			/*set all the Customer details to setters */
			customer.setNIC(request.getParameter("nic"));
			customer.setAddress(request.getParameter("address"));
			customer.setContact(request.getParameter("contact"));
			customer.setPassword(request.getParameter("password"));
			
			try {	/*calling the mysql connection class*/
					ConnectionMySql db=new ConnectionMySql();
					Connection conn=db.getCon();
				       
						/*get all the customer details from getters */
						String nic=customer.getNIC();	
						String address=customer.getAddress();
						String phone=customer.getContact();	
						String password=customer.getPassword();
						String query1="select count(C_ID) from Customer where C_NIC='"+nic+"'";
						Statement stmt1= conn.createStatement();
				        ResultSet r=stmt1.executeQuery(query1);
				        while(r.next()){
					        int i1=r.getInt("count(C_ID)");
					        
					        if(i1==1){
					        	/*when no of customers equal to one*/
								String query = "UPDATE Customer SET C_NIC='"+nic+"',C_Address='"+address+"',C_Phone='"+phone+"',C_Password='"+password+"'  WHERE C_NIC='"+nic+"' ";
						        Statement stmt= conn.createStatement();
						        int i=stmt.executeUpdate(query);
						        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/Customer.jsp");
					            requestDispatcher.forward(request, response);
					            
					        }else {
					        	/*when no of customers isn't equal to one*/
					        	System.out.println("Unregistered Customer");
					        	RequestDispatcher requestDispatcher = request.getRequestDispatcher("/UpdateCustomer.jsp");
					            requestDispatcher.forward(request, response);
					        }
				        }	
				      
				       
			    } catch (Exception e) {
			       System.err.println(e);
			    }
	}else {
		/*Works only when Employee isn't logged in*/
		response.sendRedirect("Login.jsp");
	}
	
	}

}
