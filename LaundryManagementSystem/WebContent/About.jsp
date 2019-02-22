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
<link rel="stylesheet" type="text/css" href="about-style.css"/>
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
				<h1 style=margin-top:40px;>Wash , Dry & Fold Laundry Service</h1>
				
				<p style=margin-top:50px;text-align:justify;text-justify:inter-word;font-size:20px;margin-left:100px;margin-right:100px;>Our Wash and Fold Laundry Service is a convenient and affordable method of sending out your laundry to be done by professionals. Unlike our dry cleaning or residential laundry services, this service launders your clothes in commercial washers and dryers similar to those you might have at home. There are many time starved people such as professionals, students, business owners, skilled laborers, and senior citizens that take advantage of our Wash and Fold Laundry Service to save them time and reduce the headache of dealing with laundry day.</p>
					
				<p style=text-align:justify;text-justify:inter-word;font-size:20px;margin-left:100px;margin-right:100px;>A good wash and fold laundry service begins with dropping off your unsorted soiled laundry. Our service will identify the washing requirements of each item of clothing and separate them by color, temperature, and degree of agitation. Then our professional staff can safely wash every load with a high-quality detergent, chlorine or all fabric bleach, and optional fabric softener. They will gently dry your clothes, and carefully fold anything that doesnot need to be ironed, such as knit shirts, pants, or socks, for you to pick up at your convenience.</p>
				<p style=text-align:justify;text-justify:inter-word;font-size:20px;margin-left:100px;margin-right:100px;>Also our coin laundry facility has the added convenience of professional dry cleaning for items that need to be pressed. A typical Wash and Fold Laundry Service charges by the pound and folds all of your items. Our service goes one step further by offering hangers, de-greasers, de-odorizers, and pre-treatment of stains at no additional charge.</p>
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