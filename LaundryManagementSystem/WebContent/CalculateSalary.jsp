<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%ResultSet resultset =null;%>
<%session.setAttribute("MSG1",null); 
session.setAttribute("MSG2",null);
session.setAttribute("MSG3",null);
%>        
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="calculateSalary-style.css"/>
<script type="text/javascript" src="calculateSalary-validate.js">
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
				<div class="Calculate">
				<div class="Calculate-title">
				<h1>Calculate Employee Salary</h1>
				</div>
				<form name="myForms" method="POST" onsubmit="return formValidation()" action="CalculateSalary">
				<table style="margin-left:100px;padding-top:30px;">
				<tr>
				<td>Full Name:</td>
				<td><select name="fullname" style="width:383px; height:30px;padding-left:16px;border-radius:5px;margin-left:55px;">
        <option value="" disabled selected>--Select an Employee--</option>
				<%
			    	try{
			    		Class.forName("com.mysql.jdbc.Driver").newInstance();
						Connection connection =  DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "12345");
						Statement statement1 = connection.createStatement() ;
						resultset =statement1.executeQuery("select * from Employee") ;
						%>
			        <%  while(resultset.next()){ %>
			            <option value="<%= resultset.getString("E_FullName")%>"><%= resultset.getString("E_FullName")%></option>
			            
			        <% } 
			        
			        }
			        catch(Exception e)
			        {
			             out.println("wrong entry"+e);
			        }
				%></select>
			
			
			</tr>
			<tr style=height:8px;></tr>
			<tr>
				<td>OT Hours:</td>
				<td><input type="text" name="othours" style="width:364px; height:30px;padding-left:16px;border-radius:5px;margin-left:55px;"/></td>
			
			</tr>
			<tr style=height:8px;></tr>
			<tr>
				<td>OT Rate(Per Hour):</td>
				<td><input type="text" name="otrate" style="width:364px; height:30px;padding-left:16px;border-radius:5px;margin-left:55px;"/></td>
			
			</tr>
			<tr style=height:50px;></tr>
			</table>
			<input type="submit" value="Caculate" class="calculate-button" style="width:140px;height:50px;background:linear-gradient(to bottom right, #1c4c89, #2282a3);color:white;border-radius:9px;margin-top:0px;margin-left:200px;"/> 
			<input type="reset" value="Reset" class="reset-button" style="width:140px;height:50px;background:linear-gradient(to bottom right, #1c4c89, #2282a3);color:white;border-radius:9px;margin-top:0px;margin-left:100px;"/>
			
			
			</form>
			<%String salary=(String)request.getAttribute("fullsalary");
			
			if(salary!=null){
			out.write ("<h2 style='margin-left:220px;margin-top:80px;'>Estimated Salary: Rs."+salary+"</h2>");
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