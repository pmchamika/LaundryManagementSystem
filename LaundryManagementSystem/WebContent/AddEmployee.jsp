<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="addEmployee-style.css"/>
<script type="text/javascript" src="addEmployee-validate.js">
</script>
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
				<div class="Add">
				<div class="Add-title">
				<h1>Add Employee</h1>
				</div>
				<form name="myForms" method="POST" onsubmit="return formValidation()" action="AddEmployee">
				<table style="margin-left:100px;padding-top:30px;">
				<tr><%if(session.getAttribute("MSG2")!=null){
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
				<td>NIC:</td>
				<td><input type="text" name="nic" placeholder="    123456789V" style="width:364px; height:30px;padding-left:16px;border-radius:5px;margin-left:55px;"/></td>
			</tr>
			<tr style=height:8px;></tr>
			<tr> 
				<td>Address:</td>
				<td><textarea name="address" style="width:364px;height:60px;padding-left:16px;border-radius:5px;margin-left:55px;"/></textarea></td>
			</tr>
			<tr style=height:8px;></tr>
			<tr>
				<td>Designation:</td>
				<td><input type="text" name="designation" style="width:364px; height:30px;padding-left:16px;border-radius:5px;margin-left:55px;"/></td>
			</tr>
			<tr style=height:8px;></tr>
			<tr>
				<td>Date Of Birth:</td>
				<td><input type="text" name="dob" placeholder="    DD/MM/YYYY" style="width:364px; height:30px;padding-left:16px;border-radius:5px;margin-left:55px;"/></td>
			</tr>
			<tr style=height:8px;></tr>
			<tr>
				<td>Basic Salary:</td>
				<td><input type="text" name="basicsalary" style="width:364px; height:30px;padding-left:16px;border-radius:5px;margin-left:55px;"/></td>
			
			</tr>
			<tr style=height:8px;></tr>
			<tr>
				<td>Password:</td>
				<td><input type="password" name="password" style="width:364px; height:30px;padding-left:16px;border-radius:5px;margin-left:55px;"/></td>
			</tr>
			
			<tr style=height:50px;></tr>
			</table>
			
				<input type="submit" value="Add Employee" class="add-button" style="width:140px;height:50px;background:linear-gradient(to bottom right, #1c4c89, #2282a3);color:white;border-radius:9px;margin-top:0px;margin-left:200px;"/>
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