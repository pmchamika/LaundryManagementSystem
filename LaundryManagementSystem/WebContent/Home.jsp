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
<link rel="stylesheet" type="text/css" href="home-style.css"/>
<title></title>
</head>
<body>
<div class="main">

		<div class="title">
		<%if((session.getAttribute("M_NIC")!=null)||(session.getAttribute("E_NIC")!=null)||(session.getAttribute("C_NIC")!=null)){
			out.write("<a style='text-decoration:none;color:white;font-weight: bold;border-radius: 30px;position: relative;margin:15px 15px;float:right;background: linear-gradient(to bottom right, #33b787, #2282a3);padding: 10px 20px;' href='Logout.jsp'>Sign out</a>");
				
				}else{
					
					out.write("<a style='text-decoration:none;color:white;font-weight: bold;border-radius: 30px;position: relative;margin:15px 15px;float:right;background: linear-gradient(to bottom right, #33b787, #2282a3);padding: 10px 20px;' href='Login.jsp'>Sign In</a>");
					out.write("<a style='text-decoration:none;color:white;font-weight: bold;border-radius: 30px;position: relative;margin:15px 15px;float:right;background: linear-gradient(to bottom right, #33b787, #2282a3);padding: 10px 20px;' href='Registration.jsp'>Sign up</a>");
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
		<div class="cover1">	
				<div class="slider">
						<div class='slide1'></div>
						<div class='slide2'></div>
						<div class='slide3'></div>
						<div class='slide4'></div>
						<div class='slide5'></div>
				</div>
			</div>
		<div class="services">	
		
		</div>
		<div class="cover2_container">
			<div class="left_side">
			
			</div>
			<div class="cover2">
				<span id="slider-image-1"></span>
				<span id="slider-image-2"></span>
				<span id="slider-image-3"></span>
				<div class="image-holder">
					<img src="Images/06.jpg" class="slider-image" />
					<img src="Images/07.jpg" class="slider-image" />
					<img src="Images/08.jpg" class="slider-image" />
				</div>
				<div class="button-holder">
					<a href="#slider-image-1" class="slider-change"></a>
					<a href="#slider-image-2" class="slider-change"></a>
					<a href="#slider-image-3" class="slider-change"></a>
				</div>
			</div>
			
			<div class="right_side">
			
			</div>
			<div class="notice">
			<div class="help">
			<table style="margin-left:300px;font-size:18px;padding-top:50px;">
			<tr><td><h3>Help</h3></td></tr>
			<tr><td><a class="notice-links" href="About.jsp">About us</a></br></td></tr>
			<tr style=height:12px;></tr>
			<tr><td><a class="notice-links" href="Contact.jsp">Contact us</a></br><td></tr>
			<tr style=height:12px;></tr>
			<tr><td><a class="notice-links" href="Terms.jsp">Terms & Conditions</a></br></td></tr>
			</table>
			</div>
			<div class="follow">
			<table style="margin-left:600px;font-size:18px;padding-top:50px;">
			<tr><td><h3>Follow us</h3></td></tr>
			<tr><td><a class="notice-links" href="www.facebook.com">Facebook</a></br></td><td></td></tr>
			<tr style=height:12px;></tr>
			<tr><td><a class="notice-links" href="www.twitter.com">Twitter</a></br></td><td></td></tr>
			<tr style=height:12px;></tr>
			<tr><td><a class="notice-links" href="www.instagram.com">Instagram</a></br></td><td></td></tr>
			</table>
			</div>
			</div>
			<div class="footer">
			
			</div>
</div>
</div>
				
</body>
</html>