<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%session.setAttribute("MSG1",null); 
session.setAttribute("MSG2",null);

%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="addOrder-style.css"/>
<script type="text/javascript" src="addOrder-validate.js">
</script>
<title></title>
</head>
<body>
<div class="main">

		<div class="title">
		<%if((session.getAttribute("M_NIC")!=null)||(session.getAttribute("E_NIC")!=null)||(session.getAttribute("C_NIC")!=null)){
			out.write("<a style='text-decoration:none;color:white;font-weight: bold;border-radius: 30px;position: relative;margin:15px 15px;float:right;background: linear-gradient(to bottom right, #33b787, #2282a3);padding: 10px 20px;' href='Logout.jsp'>Sign out</a>");
			out.write("<a style='text-decoration:none;color:white;font-weight: bold;border-radius: 30px;position: relative;margin:15px 15px;float:right;background: linear-gradient(to bottom right, #33b787, #2282a3);padding: 10px 20px;' href='Registration.jsp'>Add Customer</a>");	
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
				<div class="Add">
				<div class="Add-title">
				<h1>Add Order</h1>
				</div>
				<form name="myForms" method="POST" onsubmit="return formValidation()" action="AddOrder">
				<table style="margin-left:100px;padding-top:30px;">
				<tr><%if(session.getAttribute("MSG3")!=null){
			out.write ("<h4 style='margin-left:220px;margin-top:0px;color:red'>Unregistered Customer. Please Register to continue.</h4>");
			}%></tr>			
			
			<tr>
			<td>Customer NIC:</td>
			<td><input id ="Text4" type="text" name="nic" placeholder="    123456789V"   style="width:364px; height:30px;padding-left:16px;border-radius:5px;margin-left:55px;"/></td>
			</tr>
			
			<tr style=height:8px;></tr>
			
			<tr>
			<td>Weight (Kg):</td>
			<td><input id="Text2" type="text" name="weight"  style="width:364px; height:30px;padding-left:16px;border-radius:5px;margin-left:55px;" /></td>
			</tr>
			<tr style=height:8px;></tr>
			
			<tr>
			<td>Price Per Unit (Rs):</td>
			<td><input id="Text2" type="text" name="rate"  style="width:364px; height:30px;padding-left:16px;border-radius:5px;margin-left:55px;" /></td>
			</tr>
			
			
			
			<tr style=height:50px;></tr>
			</table>
			
				<input type="submit" value="Add Order" class="add-button" style="width:140px;height:50px;background:linear-gradient(to bottom right, #1c4c89, #2282a3);color:white;border-radius:9px;margin-top:0px;margin-left:200px;"/>
				<input type="reset" value="Reset" class="reset-button" style="width:140px;height:50px;background:linear-gradient(to bottom right, #1c4c89, #2282a3);color:white;border-radius:9px;margin-top:0px;margin-left:100px;"/>
			
			
			</form>
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