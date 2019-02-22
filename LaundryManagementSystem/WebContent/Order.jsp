<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%session.setAttribute("MSG1",null); 
session.setAttribute("MSG2",null);
session.setAttribute("MSG3",null);
%>        
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="order-style.css"/>
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
				<div class="Order">
				<div class="Order-title">
				<h1>Order Management</h1>
				<form action="AddOrder.jsp">
				<table>
				<tr><td><input type="submit" value="Add Order"  style="width:200px;height:50px;background:linear-gradient(to bottom right, #1c4c89, #2282a3);color:white;border-radius:9px;margin-top:50px;margin-left:300px;"/></td></tr>
				</table>
				</form>
				<form action="UpdateOrder.jsp">
				<table>
				<tr><td><input type="submit" value="Update Order" style="width:200px;height:50px;background:linear-gradient(to bottom right, #1c4c89, #2282a3);color:white;border-radius:9px;margin-top:50px;margin-left:300px;"/></td></tr>
				</table>
				</form>
				<form action="DeleteOrder.jsp">
				<table>
				<tr><td><input type="submit" value="Delete Order" style="width:200px;height:50px;background:linear-gradient(to bottom right, #1c4c89, #2282a3);color:white;border-radius:9px;margin-top:50px;margin-left:300px;"/></td></tr>
				</table>
				</form>
				<form action="OrderStatus.jsp">
				<table>
				<tr><td><input type="submit" value="View Order" style="width:200px;height:50px;background:linear-gradient(to bottom right, #1c4c89, #2282a3);color:white;border-radius:9px;margin-top:50px;margin-left:300px;"/></td></tr>
				</table>
				</form>
				
				
				</div>
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