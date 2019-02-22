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
import com.Models.Manager;

/**
 * Servlet implementation class UpdateManagerServlet
 * 
 * @author Chamika Pathiraja
 */
@WebServlet("/UpdateManagerServlet")
public class UpdateManagerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateManagerServlet() {
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
		if(session.getAttribute("M_NIC")!=null){
			/*Works only  when Manager logged in*/	
			
			Manager manager=new Manager();
			/*set all the Manager details to setters */
			manager.setNIC(request.getParameter("nic"));
			manager.setFullName(request.getParameter("fname"));
			manager.setPassword(request.getParameter("password"));
			
			try {	/*calling the mysql connection class*/
					ConnectionMySql db=new ConnectionMySql();
					Connection conn=db.getCon();;
				       	
						/*get all the Manager details from getters */
						String nic=manager.getNIC();	
						String name=manager.getFullName();	
						String password=manager.getPassword();
						
						String query = "UPDATE Manager SET M_NIC='"+nic+"',M_Name='"+name+"',M_Password='"+password+"' WHERE M_ID='1' ";
				        Statement stmt= conn.createStatement();
				        int i=stmt.executeUpdate(query);
				        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/Manager.jsp");
			            requestDispatcher.forward(request, response);
			            
				        	
				      
				       
			    } catch (Exception e) {
			       System.err.println(e);
			    }
	}else {
		/*when Manager isn't logged in */
		response.sendRedirect("Login.jsp");
	}
	}

}
