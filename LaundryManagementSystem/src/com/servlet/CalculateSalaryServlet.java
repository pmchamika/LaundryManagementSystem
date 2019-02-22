package com.servlet;
import java.sql.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Calculations.Calculate;
import com.Calculations.CalculateSalary;
import com.DBconnect.ConnectionMySql;
import com.Models.Employee;

/**
 * Servlet implementation class CalculateSalaryServlet
 * 
 * @author Chamika Prabath
 */
@WebServlet("/CalculateSalaryServlet")
public class CalculateSalaryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CalculateSalaryServlet() {
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
					
			        String name=employee.getFullName();	
			        String oth=request.getParameter("othours");
			        String otr=request.getParameter("otrate");
			        double othours = Double.parseDouble(oth);
			        double otrate = Double.parseDouble(otr);
			        
			        String query = "SELECT E_BasicSalary FROM Employee Where E_FullName='"+name+"'";
			        Statement stmt= conn.createStatement();
			        ResultSet r=stmt.executeQuery(query);
			        while(r.next()){
				        String bs=r.getString("E_BasicSalary");
				        double basicsalary = Double.parseDouble(bs);//converting string to double
				        
				        /*calling calculate interface*/
				        Calculate c=new CalculateSalary(othours,otrate,basicsalary);
				        double salary=c.Calculation();
				        
				        String sal = String.valueOf(salary);//converting double to string
				        request.setAttribute("fullsalary", sal);
				        RequestDispatcher rd=request.getRequestDispatcher("CalculateSalary.jsp");
				        rd.forward(request, response);
			        }
		       
		    } catch (Exception e) {
		       System.err.println(e);
		    }
	}else {
		/*when manager isn't logged in */
		response.sendRedirect("Login.jsp");
	}
	}

}
