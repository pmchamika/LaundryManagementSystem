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
 * Servlet implementation class UpdateEmployeeServlet
 * 
 * @author Chamika Prabath
 */
@WebServlet("/UpdateEmployeeServlet")
public class UpdateEmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateEmployeeServlet() {
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
			/*set all the Employee details to setters */
		    employee.setFullName(request.getParameter("fullname"));
			employee.setNIC(request.getParameter("nic"));
			employee.setAddress(request.getParameter("address"));
			employee.setDOB(request.getParameter("dob"));
			employee.setDesignation(request.getParameter("designation"));
			employee.setBasicSalary(request.getParameter("basicsalary"));
			employee.setPassword(request.getParameter("password"));
			
			try {	/*calling the mysql connection class*/
					ConnectionMySql db=new ConnectionMySql();
					Connection conn=db.getCon();
					
					/*get all the Employee details from getters */
				        String name=employee.getFullName();	
						String nic=employee.getNIC();	
						String address=employee.getAddress();
						String designation=employee.getDesignation();
						String dob=employee.getDOB();	
						String basicsal=employee.getBasicSalary();
						String password=employee.getPassword();
						String query = "UPDATE Employee SET E_NIC='"+nic+"',E_Address='"+address+"',E_Designation='"+designation+"',E_BasicSalary='"+basicsal+"',E_DOB='"+dob+"',E_Password='"+password+"'  WHERE E_FullName='"+name+"' ";
				        Statement stmt= conn.createStatement();
				        int i=stmt.executeUpdate(query);
				        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/Employee.jsp");
			            requestDispatcher.forward(request, response);
				      
			       
			    } catch (Exception e) {
			       System.err.println(e);
			    }
	}else {
		/*Works only  when Manager isn't logged in*/
		response.sendRedirect("Login.jsp");
	}
	}

}
