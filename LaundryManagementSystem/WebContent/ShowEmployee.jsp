<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="com.DBconnect.ConnectionMySql" %>
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
<link rel="stylesheet" type="text/css" href="showEmployee-style.css"/>
<script type="text/javascript" src="showEmployee-validate.js">
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
				<div class="Show">
				<div class="Show-title">
				<h1>View Employee</h1>
				</div>
				<form name="myForms" method="POST" onsubmit="return formValidation()" action="ShowEmployee">
				<table style="margin-left:100px;padding-top:30px;">
				<tr>
				<td>Full Name:</td>
				<td><select name="fullname" style="width:383px; height:30px;padding-left:16px;border-radius:5px;margin-left:55px;">
        <option value="" disabled selected>--Select an Employee--</option>
				<%
			    	try{
			    		ConnectionMySql db=new ConnectionMySql();
						Connection conn=db.getCon();
						Statement statement = conn.createStatement() ;
						resultset =statement.executeQuery("select * from Employee") ;
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
			
			<tr style=height:50px;></tr>
			</table>
				<input type="submit" value="View Employee" class="add-button" style="width:140px;height:50px;background:linear-gradient(to bottom right, #1c4c89, #2282a3);color:white;border-radius:9px;margin-top:0px;margin-left:200px;"/>
				<input type="reset" value="Reset" class="reset-button" style="width:140px;height:50px;background:linear-gradient(to bottom right, #1c4c89, #2282a3);color:white;border-radius:9px;margin-top:0px;margin-left:100px;"/>
			
			
			</form>
			<%String id=(String)request.getAttribute("ID");
			String name=(String)request.getAttribute("FullName");
			String gender=(String)request.getAttribute("Gender");
			String address=(String)request.getAttribute("Address");
			String nic=(String)request.getAttribute("NIC");
			String designation=(String)request.getAttribute("Designation");
			String dob=(String)request.getAttribute("DOB");
			String basicsalary=(String)request.getAttribute("BasicSalary");
			
			if((id!=null)&&(name!=null)&&(gender!=null)&&(address!=null)&&(nic!=null)&&(designation!=null)&&(dob!=null)&&(basicsalary!=null)){
				out.write("<h1 style='margin-left:220px;margin-top:80px;color:#001b2d;'><pre>Employee Name:      "+name+"</pre></h1>");
				out.write("<h1 style='margin-left:220px;margin-top:80px;color:#001b2d;'><pre>Employee ID:        "+id+"</pre></h1>");
				out.write("<h1 style='margin-left:220px;margin-top:80px;color:#001b2d;'><pre>Gender:             "+gender+"</pre></h1>");
				out.write("<h1 style='margin-left:220px;margin-top:80px;color:#001b2d;'><pre>Address:            "+address+"</pre></h1>");
				out.write("<h1 style='margin-left:220px;margin-top:80px;color:#001b2d;'><pre>NIC:                "+nic+"</pre></h1>");
				out.write("<h1 style='margin-left:220px;margin-top:80px;color:#001b2d;'><pre>Designation:        "+designation+"</pre></h1>");
				out.write("<h1 style='margin-left:220px;margin-top:80px;color:#001b2d;'><pre>Date of Birth: 	    "+dob+"</pre></h1>");
				out.write("<h1 style='margin-left:220px;margin-top:80px;color:#001b2d;'><pre>Basic Salary(Rs.):  "+basicsalary+"</pre></h1>");
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