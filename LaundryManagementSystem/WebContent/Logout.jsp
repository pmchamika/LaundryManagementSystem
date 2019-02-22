<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% if((session.getAttribute("M_NIC")!=null)||(session.getAttribute("E_NIC")!=null)||(session.getAttribute("C_NIC")!=null)){
	
	session.removeAttribute("M_NIC");
	session.removeAttribute("E_NIC");
	session.removeAttribute("C_NIC");
	session.invalidate();
	response.sendRedirect("Home.jsp");
}else{
	response.sendRedirect("Home.jsp");	
	
	
}		
%>

</body>
</html>