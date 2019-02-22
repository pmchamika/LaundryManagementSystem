<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%session.setAttribute("MSG3",null); 
session.setAttribute("MSG2",null);

%>       
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="registration-style.css"/>
<script type="text/javascript" src="registration-validate.js">
</script>
<title></title>
</head>
<body>
<div class="main">

		<div class="title">
		<%if((session.getAttribute("M_NIC")!=null)||(session.getAttribute("E_NIC")!=null)||(session.getAttribute("C_NIC")!=null)){
			out.write("<a style='text-decoration:none;color:white;font-weight: bold;border-radius: 30px;position: relative;margin:15px 15px;float:right;background: linear-gradient(to bottom right, #33b787, #2282a3);padding: 10px 20px;' href='Logout.jsp'>Sign out</a>");
			out.write("<a style='text-decoration:none;color:white;font-weight: bold;border-radius: 30px;position: relative;margin:15px 15px;float:right;background: linear-gradient(to bottom right, #33b787, #2282a3);padding: 10px 20px;' href='AddOrder.jsp'>Add Order</a>");		
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
		<div>
				<div class="left_sidebar">
				</div>
				<div class="reg_form">
				<div class="Register">
				<div class="Registration-title">
				<h1>Customer Registration</h1>
				</div>
				<form name="myForms" method="POST" onsubmit="return formValidation()" action="Registration">
				<table style="margin-left:100px;padding-top:30px;">
				<tr><%if(session.getAttribute("MSG1")!=null){
			out.write ("<h4 style='margin-left:220px;margin-top:0px;color:red'>Entered NIC is Already Registered. Please Check again.</h4>");
			}%></tr>
				<tr>
				<td>Full Name:</td>
				<td><input type="text" name="fullname" style="width:364px; height:30px;padding-left:16px;border-radius:5px;margin-left:55px;"/></td>
				</tr>
				<tr style=height:8px;></tr>
				<tr>
				<td>Gender:</td>
				<td><select name="gender" style="width:383px; height:30px;padding-left:16px;border-radius:5px;margin-left:55px;">
						<option value="male">Male</option>
						<option value="female">Female</option>
						</select></td>
				</tr>		
				<tr style=height:8px;></tr>
				<tr> 
					<td>Address:</td>
					<td><textarea name="address" style="width:364px;height:60px;padding-left:16px;border-radius:5px;margin-left:55px;"/></textarea></td>
				</tr>
				<tr style=height:8px;></tr>
				<tr>
					<td>NIC:</td>
					<td><input type="text" name="nic" placeholder="    123456789V" style="width:364px; height:30px;padding-left:16px;border-radius:5px;margin-left:55px;"/></td>
				</tr>
				<tr style=height:8px;></tr>
				<tr>
					<td>Contact Number:</td>
					<td><input type="text" name="contact" placeholder="    0770000000" style="width:364px; height:30px;padding-left:16px;border-radius:5px;margin-left:55px;"/></td>
				</tr>
				<tr style=height:8px;></tr>
				<tr>
					<td>Password:</td>
					<td><input type="password" name="password" style="width:364px; height:30px;padding-left:16px;border-radius:5px;margin-left:55px;"/></td>
				</tr>
				<tr style=height:8px;></tr>
				<tr>
					<td>Confirm Password:</td>
					<td><input type="password" name="cpassword" style="width:364px; height:30px;padding-left:16px;border-radius:5px;margin-left:55px;"/></td>
				</tr>	
				<tr style=height:40px;></tr>
				<tr><td><a class="terms" href="Terms.jsp" ><font color="#071aef">Terms and Conditions</a></td></tr>
				<tr><td style="width:210px;">By clicking "Sign up",I agree to the Terms and Conditions of the service.</td></tr>
				<tr style=height:12px;></tr>
				<tr>
				<td><input name="submit" type="submit" Value="Sign up" style="width:70px;height:30px;background-color:#071aef;color:white;border-radius:9px;margin-top:10px;margin-left:60px;"/></td>
				<td><input type="button" Value="Sign in" onclick="location='Login.jsp'" style="width:70px;height:30px;background-color:#071aef;color:white;border-radius:9px;margin-top:10px;margin-left:160px;"/></td>
				<tr><td></td><td><p style="margin-left:120px;">Already have an account ?</p></td></tr>
				
				
				</table>
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