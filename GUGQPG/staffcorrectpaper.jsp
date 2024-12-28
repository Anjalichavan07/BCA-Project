<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>Home</title>
		
		<jsp:include page="design/head.jsp"></jsp:include>
	</head>
	<body>
	<jsp:include page="design/staffupperbody.jsp"></jsp:include>
	<form  name="displayform" method="post">
	<h2 align="left">Cadet List</h2> 
	<br />

	<%@include file="getconnection.jsp" %>

<%	
	
	
	
%>	
	<jsp:include page="design/lowerbody.jsp"></jsp:include>

		</body>
</html>