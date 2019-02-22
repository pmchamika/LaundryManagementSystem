<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="login-style.css"/>
<script type="text/javascript" src="login-validate.js">
</script>
<title></title>
</head>
<body>
<div class="main">

		<div class="title">
		</div>
		<div class="top_menu">
				<a class="menu1" href="Home.jsp">Home</a>
				<a class="menu4" href="Contact.jsp">Contact</a>
				<a class="menu5" href="About.jsp">About</a>
				
		</div>
		<div>
				
				<div class="reg_form">
				<div class="table">
				<div class="reg-title">
				<h1>Sign in</h1>
				</div>
				<form name="myForms" method="POST" onsubmit="return formValidation()" Action="Login">
				<table>
				<tr style=height:12px;></tr>
			<tr>
			<td>NIC:&nbsp;</td>
			<td><input type="text" name="nic" placeholder="    123456789V" style="width:250px; height:25px; margin-left:10px;border-radius:7px"/></td>
			</tr>
			<tr style=height:12px;></tr>
			<tr style=height:6px;></tr>
			<tr>
			<td>Password:&nbsp;</td>
			<td><Input  type="password" name="password"  style="width:250px; height:25px; margin-left:10px;border-radius:7px"/></td>
			</tr>
			<tr style=height:12px;></tr>
			<tr>
			<td></td><td><input name="submit" type="submit" Value="Sign in" style="width:70px;height:30px;background-color:#071aef;color:white;border-radius:9px;margin-top:10px;margin-left:60px;"/></td></tr>
			
			</table>
			</form>
			</div>
							
				</div>
				
			</div>
			<div class="footer">
			
			</div>
	</div>
</body>
</html>