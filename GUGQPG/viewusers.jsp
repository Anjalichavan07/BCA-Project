<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>Registered Users</title>
		
		<jsp:include page="design/head.jsp"></jsp:include>
	</head>
	<body>
	<jsp:include page="design/adminupperbody.jsp"></jsp:include>
	<form  name="displayform" method="post">
	<h1 align="center"> Registered Users</h1> <br />
<br />

	<%@include file="getconnection.jsp" %>

<%	
if(request.getParameter("value")!=null)
		{
			st.executeUpdate("delete from tbluserregister where emailid='"+(request.getParameter("value"))+"'");		
			
			%>
			<script language="javascript" type="text/javascript">
			alert("Record Deleted");
			location.href="viewusers.jsp";
			</script>
			<%
		}
try
{
	rs=st.executeQuery("select * from tbluserregister;");
	%>
	<table align="center" border="1">
	<tr>
		<th>First Name</th>
		<th>Last Name</th>
		<th>Email ID</th>
		<th>Mobile Number</th>
		<th>Gender</th>
		<th>City</th>
		<th>Delete</th>
	</tr>
	<%
	while(rs.next())
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
		
			<td><%=name%></td>
			<td><%=lastname%></td>
			<td><%=emailid%></td>
		<td><%=mobileno%></td>
		<td><%=gender%></td>
	<td><%=city%></td>
		<td>
			<a href="viewusers.jsp?value=<%=emailid%>">Delete</a>
		</td>	
		</tr>
<%
}
%>
</table>
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