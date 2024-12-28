<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Admin Home</title>
<jsp:include page="design/head.jsp"></jsp:include>
</head>

<body>
<jsp:include page="design/adminupperbody.jsp"></jsp:include>
			<%@include file="getconnection.jsp" %>
<table width="80%" align="center">
	<tr>
		<th align="center">
			<a href="adminviewstudents.jsp?val=1">New Cadets</a>
		</th>
		<th align="center">
	<a href="adminviewstudents.jsp?val=2">Approved Cadets</a>
		</th>
	<th align="center">
		<a href="adminviewstudents.jsp?val=3">Rejected Cadets</a>

	</th>
	</tr>
	
</table>
			<%@include file="msg.jsp" %>

<%!
	int val=1;
%>

<%


	if(request.getParameter("val")!=null)
	{
		val=Integer.parseInt(request.getParameter("val"));
	}
	//if(val==1)
	{
%>
<table align="center" border="1">
<tr>
	<th>Full Name</th>
	<th>Chest No.</th>
	<th>Email ID</th>
	<th>Mobile No.</th>
	<th>Gender</th>
	<th>Course</th>
	<th>Approve</th>
	<th>Reject</th>
	

</tr>
<%

try
{
	rs=st.executeQuery("select * from tbluserregister where status="+val+" order by username");
	while(rs.next())
	{
	%>
		<tr>
			<td><%=rs.getString("firstname").toUpperCase()%> <%=rs.getString("lastname").toUpperCase()%></td>
			<td><%=rs.getString("username")%></td>
			<td><%=rs.getString("emailid")%></td>
			<td><%=rs.getString("mobilenumber")%></td>
			<td><%=rs.getString("gender")%></td>
			<td><%=rs.getString("city")%></td>
			<td><a href="makechange.jsp?id=<%=rs.getString("username")%>&status=2">Approve</a></td>
			<td><a href="makechange.jsp?rid=<%=rs.getString("username")%>&status=3">Reject</a></td>
		</tr>
	<%
	}
	rs.close();
}
catch(Exception exe)
{
		System.out.println(exe);
}

%>
</table>
<%
	}
%>
<jsp:include page="design/lowerbody.jsp"></jsp:include>
</body>
</html>
