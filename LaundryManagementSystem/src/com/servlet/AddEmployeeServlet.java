package com.servlet;
import java.sql.*;
import javax.sql.*;

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
import com.mysql.jdbc.Driver;

/**
 * Servlet implementation class AddEmployeeServlet
 * 
 * @author Chamika Prabath
 */
@WebServlet("/AddEmployeeServlet")
public class AddEmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddEmployeeServlet() {
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
				/*set all the employee details to setters */
		    employee.setFullName(request.getParameter("fullname"));
			employee.setGender(request.getParameter("gender"));
			employee.setNIC(request.getParameter("nic"));
			employee.setAddress(request.getParameter("address"));
			employee.setDesignation(request.getParameter("designation"));
			employee.setDOB(request.getParameter("dob"));
			employee.setBasicSalary(request.getParameter("basicsalary"));
			employee.setPassword(request.getParameter("password"));
			
			try {	/*calling the mysql connection class*/
					ConnectionMySql db=new ConnectionMySql();
					Connection conn=db.getCon();
					
					/*get all the employee details through getters */
			        String name=employee.getFullName();	
					String gender=employee.getGender();	
					String nic=employee.getNIC();	
					String address=employee.getAddress();
					String designation=employee.getDesignation();	
					String dob=employee.getDOB();	
					String basicsal=employee.getBasicSalary();
					String password=employee.getPassword();
					
					String query1="select count(E_ID) from Employee where E_NIC='"+nic+"'";
					Statement stmt1= conn.createStatement();
			        ResultSet r=stmt1.executeQuery(query1);
			        while(r.next()){
			        int i1=r.getInt("count(E_ID)");
			        
				        if(i1==0){
				        	/*when no of employees equal to zero*/
				        String query2 = "insert into Employee(E_FullName,E_Gender,E_NIC,E_Address,E_Designation,E_DOB,E_BasicSalary,E_Password) values ('"+name+"','"+gender+"','"+nic+"','"+address+"','"+designation+"','"+dob+"','"+basicsal+"','"+password+"')";
				        Statement stmt2= conn.createStatement();
				        int i2=stmt2.executeUpdate(query2);
				        
					        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/Employee.jsp");
				            requestDispatcher.forward(request, response);
				        }else {
				        	/*when no of employees is not equal to zero*/
				        	String msg="Duplicate";
				        	session.setAttribute("MSG2",msg);
				        	System.out.println("Duplicate NIC");
				        	RequestDispatcher requestDispatcher = request.getRequestDispatcher("/AddEmployee.jsp");
				            requestDispatcher.forward(request, response);
				        }
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
