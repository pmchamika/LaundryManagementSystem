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
import com.Models.Employee;

/**
 * Servlet implementation class ShowEmplyeeServlet
 * 
 * @author Chamika Prabath
 */
@WebServlet("/ShowEmplyeeServlet")
public class ShowEmplyeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowEmplyeeServlet() {
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
				/*get the employee nic from getters */
		        String name=employee.getFullName();
		        String query = "select * from Employee where E_FullName='"+name+"'";
		        Statement stmt= conn.createStatement();
		        ResultSet r=stmt.executeQuery(query);
		        
		        while(r.next()){
		        	String fname=r.getString("E_FullName");
			        String id=r.getString("E_ID");
			        String gender=r.getString("E_Gender");       
			        String address=r.getString("E_Address"); 
			        String nic=r.getString("E_NIC"); 
			        String designation=r.getString("E_Designation"); 
			        String dob=r.getString("E_DOB"); 
			        String basicsalary=r.getString("E_BasicSalary"); 
			         
			        request.setAttribute("FullName", fname);
			        request.setAttribute("ID", id);
			        request.setAttribute("Gender", gender);
			        request.setAttribute("Address", address);
			        request.setAttribute("NIC", nic);
			        request.setAttribute("Designation", designation);
			        request.setAttribute("DOB", dob);
			        request.setAttribute("BasicSalary", basicsalary);
			        RequestDispatcher rd= request.getRequestDispatcher("ShowEmployee.jsp");
			        rd.forward(request, response);
			        }
	       
	    } catch (Exception e) {
	       System.err.println(e);
	    }
	}else {
		/*Works only  when Manager isn't logged in*/
		response.sendRedirect("Login.jsp");
	}
		
	}	
}
