<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="com.DBconnect.ConnectionMySql" %>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="nonParameterized-style.css"/>
<title></title>
</head>
<body>
<div class="main">

		<div class="title">
		<%if((session.getAttribute("M_NIC")!=null)||(session.getAttribute("E_NIC")!=null)||(session.getAttribute("C_NIC")!=null)){
			out.write("<a style='text-decoration:none;color:white;font-weight: bold;border-radius: 30px;position: relative;margin:15px 15px;float:right;background: linear-gradient(to bottom right, #33b787, #2282a3);padding: 10px 20px;' href='Logout.jsp'>Sign out</a>");
				
				}
		%>
		</div>
		<div class="top_menu">
				<a class="menu1" href="Home.jsp">Home</a>
					<%if(session.getAttribute("M_NIC")!=null){
					out.write("<a class='menu2' href='Employee.jsp'>Management</a>");
					out.write("<a class='menu2' href='Manager.jsp'>Manager Account</a>");
				}
					else if(session.getAttribute("E_NIC")!=null){
						out.write("<a class='menu2' href='Order.jsp'>Manage Orders</a>");
						out.write("<a class='menu3' href='Customer.jsp'>Manage Customer</a>");
					}
					else if(session.getAttribute("C_NIC")!=null){
						out.write("<a class='menu3' href='OrderStatus.jsp'>Order Status</a>");
					}
				
				%>
				
				
				<a class="menu4" href="Contact.jsp">Contact</a>
				<a class="menu5" href="About.jsp">About</a>
				
		</div>
		<div>
				<div class="left_sidebar">
				
				</div>
				<div class="reg_form">
				<div class="Show">
				<div class="Show-title">
				<h1>NonParameterized Report</h1>
				</div>
				<%
				if(session.getAttribute("M_NIC")!=null){
			    	try{
			    		ConnectionMySql db=new ConnectionMySql();
						Connection conn=db.getCon();
						Statement statement = conn.createStatement() ;
						ResultSet r =statement.executeQuery("select * from LaundryOrder") ;
						
						out.write("<table style='margin-left:50px;padding-top:30px;overflow-y:scroll;border:1px solid #ddd;table-layout:fixed;width:700px;height:1100px;text-align:left;'>");
						out.write("<tr><th>Reciept ID</th><th>Customer NIC</th><th>Employee NIC</th><th>Order Weight (kg)</th><th>Order Date</th><th>Payment (Rs)</th></tr>");
						while(r.next()){
							String id=r.getString("O_ID");
							String weight=r.getString("O_Weight");
							String date=r.getString("O_Date");
							String payment=r.getString("O_Payment");
							String cus=r.getString("C_NIC");
							String emp=r.getString("E_NIC");
							
							
							out.write("<tr><td>"+id+"</td><td>"+cus+"</td><td>"+emp+"</td><td>"+weight+"</td><td>"+date+"</td><td>"+payment+"</td></tr>");
							
							
							
						}
						out.write("</table>");
			    	}catch(Exception e){
			             out.println("wrong entry"+e);
			        }
				}else {
					response.sendRedirect("Login.jsp");
				}%>
				
		
			</div>
			</div>
			<div class="right_sidebar">
				
			</div>
			</div>
			<div class="footer">
			
			</div>
		 
				
				
</div>
</body>
</html>