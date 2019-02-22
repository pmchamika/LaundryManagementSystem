<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="com.DBconnect.ConnectionMySql" %>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="nonParameterized-style.css"/>
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
				<h1>Parameterized Report</h1>
				</div>
				<form name="myForms" method="POST" action="report">
					<table style="margin-left:100px;padding-top:30px;">
					<tr>
					<td>Date:</td>
					<td><input type="text" name="date" placeholder="    DD/MM/YYYY" style="width:364px; height:30px;padding-left:16px;border-radius:5px;margin-left:55px;"/></td>
					</tr>
				
					<tr style=height:30px;></tr>
					</table>
					<input type="submit" value="View Report" class="add-button" style="width:140px;height:50px;background:linear-gradient(to bottom right, #1c4c89, #2282a3);color:white;border-radius:9px;margin-top:0px;margin-left:200px;"/>
					<input type="reset" value="Reset" class="reset-button" style="width:140px;height:50px;background:linear-gradient(to bottom right, #1c4c89, #2282a3);color:white;border-radius:9px;margin-top:0px;margin-left:100px;"/>
				<table>
				<tr style=height:30px;></tr>
				</table>
				</form>
				
				<%String odate=(String)request.getAttribute("date");
				double total=0;
				
				try{
		    		ConnectionMySql db=new ConnectionMySql();
					Connection conn=db.getCon();
					Statement statement = conn.createStatement() ;
					ResultSet r =statement.executeQuery("select * from LaundryOrder where O_Date='"+odate+"'") ;
					if(odate!=null){
					out.write("<table style='margin-left:50px;padding-top:30px;overflow-y:scroll;border:1px solid #ddd;table-layout:fixed;width:700px;text-align:left;'>");
					out.write("<tr><th>Reciept ID</th><th>Customer NIC</th><th>Employee NIC</th><th>Order Weight (kg)</th><th>Payment (Rs)</th></tr>");
					}
					while(r.next()){
						String id=r.getString("O_ID");
						String weight=r.getString("O_Weight");
						String date=r.getString("O_Date");
						String payment=r.getString("O_Payment");
						String cus=r.getString("C_NIC");
						String emp=r.getString("E_NIC");
						
						
						out.write("<tr><td>"+id+"</td><td>"+cus+"</td><td>"+emp+"</td><td>"+weight+"</td><td>"+payment+"</td></tr>");
						double pay=Double.parseDouble(payment);
						total=total+pay;
										
					}
					out.write("</table>");
					if(total!=0){
					out.write("<h2 style='margin-left:145px;padding-top:30px;color:green'>Estimated Income on "+odate+" is Rs: "+total+"</h2>");
					}
					}catch(Exception e){
		             out.println("wrong entry"+e);
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