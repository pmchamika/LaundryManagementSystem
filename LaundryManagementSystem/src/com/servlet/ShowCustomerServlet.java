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
 * Servlet implementation class ShowCustomerServlet
 * 
 * @author Maneesha
 */
@WebServlet("/ShowCustomerServlet")
public class ShowCustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowCustomerServlet() {
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
			/*set the customer nic to setters */
			customer.setNIC(request.getParameter("nic"));
			
			try {	/*calling the mysql connection class*/
					ConnectionMySql db=new ConnectionMySql();
					Connection conn=db.getCon();
					/*get the customer nic from getters */
			        String nic=customer.getNIC();
			        
			        String query1="select count(C_ID),C_Address,C_FullName,C_Phone,C_ID from Customer where C_NIC='"+nic+"'";
					Statement stmt1= conn.createStatement();
			        ResultSet r=stmt1.executeQuery(query1);
			        while(r.next()){
				        int i1=r.getInt("count(C_ID)");
				        
				        if(i1==1){
				        	/*when no of customers equal to one*/
				        	String id=r.getString("C_ID"); 
				        	String address=r.getString("C_Address"); 
					        String name=r.getString("C_FullName"); 
					        String phone=r.getString("C_Phone");
					        
					        request.setAttribute("ID", id);
					        request.setAttribute("Address", address);
					        request.setAttribute("NIC", nic);
					        request.setAttribute("Name", name);
					        request.setAttribute("Phone", phone);
					        RequestDispatcher rd= request.getRequestDispatcher("ShowCustomer.jsp");
					        rd.forward(request, response);
				        }else {
				        	response.sendRedirect("ShowCustomer.jsp");
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
