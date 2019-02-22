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
<link rel="stylesheet" type="text/css" href="contact-style.css"/>
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
				<div class="Customer">
				<div class="Customer-title">
				<h1 style=margin-top:40px;>Contact Info</h1>
				
				<p style=margin-top:50px;text-align:justify;text-justify:inter-word;font-size:23px;margin-left:200px;margin-right:100px;>Address :  #47/38 A, Old Airport Road, Ratmalana</p>
				<p style=text-align:justify;text-justify:inter-word;font-size:23px;margin-left:200px;margin-right:100px;>Email :  info@laundryservice.lk</p>	
				<p style=text-align:justify;text-justify:inter-word;font-size:23px;margin-left:200px;margin-right:100px;>Hotline :  011-96875645 , 011-9788566</p>	
				
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