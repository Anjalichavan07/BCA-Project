<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>Registered Users</title>
		
		<jsp:include page="design/head.jsp"></jsp:include>
	</head>
	<body>
	<jsp:include page="design/userupperbody.jsp"></jsp:include>
	<form  name="displayform" method="post">
	<h2 align="left">Profile Details</h2> 
<br />

	<%@include file="getconnection.jsp" %>

<%	
try
{
	rs=st.executeQuery("select * from tbluserregister where username='"+session.getAttribute("username").toString()+"';");
	%>
	<center>
	<table align="center" height="250px" width="400px" border="2">
		<%
	if(rs.next())
	{
	String name=rs.getString(1);
	String lastname=rs.getString(2);
	String emailid=rs.getString(4);
	String  mobileno=rs.getString(5);
	String gender=rs.getString(7);
	String city=rs.getString(8);
		//int branch=rs.getString(4);
		
%>
	<tr>
		
			<td><b>First Name:</b></td><td><%=name%></td>
	</tr>
	<tr>
			<td><b> Last Name:</b></td><td><%=lastname%></td>
	</tr>
	<tr>
			<td><b>Email ID:</b></td><td><%=emailid%></td>
	</tr>
	<tr>
		<td> <b>Mobile No.</b></td><td><%=mobileno%></td>
	</tr>
	<tr>
		<td><b>Gender:</b></td><td><%=gender%></td>
	</tr>
	<tr>
	<td><b>City:</b></td><td><%=city%></td>

			
		</tr>
<%
}
%>
</table>
</center>
<%
}
catch(Exception exe)
{
 System.out.println(exe);
}
%>

	
	
	
	
</form>		
	<jsp:include page="design/lowerbody.jsp"></jsp:include>

		</body>
</html>