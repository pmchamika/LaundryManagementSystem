package com.servlet;
import java.sql.*;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DBconnect.ConnectionMySql;
import com.Models.Employee;

/**
 * Servlet implementation class DeleteEmployeeServlet
 * 
 * @author Chamika Prabath
 */
@WebServlet("/DeleteEmployeeServlet")
public class DeleteEmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteEmployeeServlet() {
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
			
			Employee employee=new Employee();
			/*set the employee name to setters */
		    employee.setFullName(request.getParameter("fullname"));
		    
		    try {	/*calling the mysql connection class*/
			    	ConnectionMySql db=new ConnectionMySql();
					Connection conn=db.getCon();
					
					/*get the employee name from getters */
			        String name=employee.getFullName();	
			        String query = "Delete FROM Employee Where E_FullName='"+name+"'";
			        Statement stmt= conn.createStatement();
			        stmt.executeUpdate(query);
			        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/Employee.jsp");
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
