package com.servlet;

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

import com.DBconnect.ConnectionMySql;
import com.Models.Order;

/**
 * Servlet implementation class DeleteOrderServlet
 * 
 * @author Oshadi
 */
@WebServlet("/DeleteOrderServlet")
public class DeleteOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteOrderServlet() {
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
			/*Works only  when Employee logged in*/
			
			Order order=new Order();
			/*set the reciept no to setters */
			order.setRecieptNo(request.getParameter("receiptno"));
			
			try {	/*calling the mysql connection class*/
					ConnectionMySql db=new ConnectionMySql();
					Connection conn=db.getCon();
					/*get the reciept no from getters */
			        String receiptno=order.getRecieptNo();
			        
			        String query = "Delete FROM LaundryOrder Where O_ID='"+receiptno+"'";
			        Statement stmt= conn.createStatement();
			        stmt.executeUpdate(query);
			        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/Order.jsp");
		            requestDispatcher.forward(request, response);
			        
			} catch (Exception e) {
			       System.err.println(e);
			    }
		   
		}else {
			/*when employee isn't logged in */
			response.sendRedirect("Login.jsp");
		}
		
	}

}
