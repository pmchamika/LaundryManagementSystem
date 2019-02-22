package com.servlet;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DBconnect.ConnectionMySql;
/**
 * Servlet implementation class LoginServlet
 * 
 * @author Chamika Pathiraja
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
		String nic=request.getParameter("nic");
		String Password=request.getParameter("password");
		
		MessageDigest md;
		try {
			md = MessageDigest.getInstance("MD5");
		
			md.update(Password.getBytes()); 
			byte[] b = md.digest();
			StringBuffer sb=new StringBuffer();
			for(byte b1:b) {
				sb.append(Integer.toHexString(b1 & 0xff).toString());
			}
		
		String pass=sb.toString();
	
		
		if((nic!=null)&&(pass!=null)) {
			try {	/*calling the mysql connection class*/
					ConnectionMySql db=new ConnectionMySql();
					Connection conn=db.getCon();
			        
			        String query1="select C_NIC,count(C_NIC) from Customer where C_NIC='"+nic+"' and C_Password='"+pass+"'";
					Statement stmt1= conn.createStatement();
			        ResultSet r=stmt1.executeQuery(query1);
			        while(r.next()){
			        int i1=r.getInt("count(C_NIC)");
			        
			        if(i1==1){
			        	/*works when nic and password match to a customer */
			        	HttpSession session=request.getSession();
			        	session.setAttribute("C_NIC",nic);
			        	response.sendRedirect("Home.jsp");
			        	
			        }
			        else if(i1!=1){
			        	/*works when nic and password match to a Employee */
			        	String query2="select E_NIC,count(E_NIC) from Employee where E_NIC='"+nic+"' and E_Password='"+pass+"'";
						Statement stmt2= conn.createStatement();
				        ResultSet r2=stmt2.executeQuery(query2);
				        while(r2.next()){
					        int i2=r2.getInt("count(E_NIC)");
					        if(i2==1){
					        	HttpSession session=request.getSession();
					        	session.setAttribute("E_NIC",nic);
					        	response.sendRedirect("Order.jsp");
					        	
					        }else if(i2!=1){
					        	/*works when nic and password match to the manager */
					        	String query3="select M_NIC,count(M_NIC) from Manager where M_NIC='"+nic+"' and M_Password='"+pass+"'";
								Statement stmt3= conn.createStatement();
						        ResultSet r3=stmt3.executeQuery(query3);
						        while(r3.next()){
						        	int i3=r3.getInt("count(M_NIC)");
							        if(i3==1){
							        	HttpSession session=request.getSession();
							        	session.setAttribute("M_NIC",nic);
							        	
							        	response.sendRedirect("Employee.jsp");
							        }else {
							        	response.sendRedirect("Login.jsp");
							        }
						        	
						        	
						        }
					        	
					        } 
				        }
			        }
			        }
				
			}catch (Exception e) {
			       System.err.println(e);
			    }
		   
		}else {
			response.sendRedirect("Login.jsp");
		}
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
}
}
