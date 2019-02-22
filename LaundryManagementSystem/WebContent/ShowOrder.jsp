<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%ResultSet resultset =null;%>
<%int i=0;%>
<%session.setAttribute("MSG1",null); 
session.setAttribute("MSG2",null);
session.setAttribute("MSG3",null);
%>        
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="showOrder-style.css"/>


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
				<h1>Receipt</h1>
				</div>
		
			<%String nic=(String)request.getAttribute("NIC");
			String id=(String)request.getAttribute("RecieptId");
			String date=(String)request.getAttribute("Date");
			String payment=(String)request.getAttribute("Payment");
			
			
			if((id!=null)&&(nic!=null)&(date!=null)&&(payment!=null)){
				out.write("<h1 style='margin-left:220px;margin-top:80px;color:#001b2d;'><pre>Customer NIC:      "+nic+"</pre></h1>");
				out.write("<h1 style='margin-left:220px;margin-top:80px;color:#001b2d;'><pre>Reciept No:        "+id+"</pre></h1>");
				out.write("<h1 style='margin-left:220px;margin-top:80px;color:#001b2d;'><pre>Order Return Date: "+date+"</pre></h1>");
				out.write("<h1 style='margin-left:220px;margin-top:80px;color:#001b2d;'><pre>Payment(Rs): 	   "+payment+"</pre></h1>");
				
			}
		%>
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