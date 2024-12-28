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
<h2 align="left"><font color="#FF0000">Select Question Type</font></h2> 

<%@  include file="getconnection.jsp"%>

<%
	if(request.getParameter("subject").toString()!=null)
	{
		session.setAttribute("subject",request.getParameter("subject").toString());
	}
%>
<table border="1" width="100%" cellspacing="30px">

<%
	rs=st.executeQuery("select main1marks,main2marks,main3marks,main4marks,main5marks,main6marks,main7marks,main8marks from tbltestdates where testdate='"+finaldate+"' and main1marks>0");
	if(rs.next())
	{
		if(rs.getInt("main1marks")>0)
		{
		%>
<tr><td>
<font size="+3" color="red"><a href="usertypeanswer.jsp?qt=1&val=Fill in the Blanks"><h1>Fill in the Blanks</h2></a></font></td></tr>
		<%
		}
		if(rs.getInt("main2marks")>0)
		{
			%>
<tr><td><font size="+3" color="red"><a href="usertypeanswer.jsp?qt=2&val=Objective Type Questions"><h1>Objective Type Questions</h1></a></font></td></tr>
			<%		
		}	
		if(rs.getInt("main3marks")>0)
		{
			%>
<tr><td><font size="+3" color="red"><a href="usertypeanswer.jsp?qt=3&val=Match the Following"><h1>Match the Following</h1></a></font></td></tr>
			<%		
		}
		if(rs.getInt("main4marks")>0)
		{
			%>
<tr><td><font size="+3" color="red"><a href="usertypeanswer.jsp?qt=4&val=True or False"><h1>True or False</h1></a></font></td></tr>
			<%		
		}
		if(rs.getInt("main5marks")>0)
		{
			%>
<tr><td><font size="+3" color="red"><a href="usertypeanswer.jsp?qt=5&val=1 Line Answers"><h1>1 Line Answers</h1></a></font></td></tr>
			<%		
		}
		if(rs.getInt("main6marks")>0)
		{
			%>
<tr><td><font size="+3" color="red"><a href="usertypeanswer.jsp?qt=6&val=Letter/Essay"><h1>Letter/Essay</h1></a></font></td></tr>
			<%		
		}
		if(rs.getInt("main7marks")>0)
		{
			%>
<tr><td><font size="+3" color="red"><a href="usertypeanswer.jsp?qt=7&val=Descriptive Type Answers"><h1>Descriptive Type Answers</h1></a></font></td></tr>
			<%		
		}
		if(rs.getInt("main8marks")>0)
		{
			%>
<tr><td><font size="+3" color="red"><a href="usertypeanswer.jsp?qt=8&val=Write Short Notes"><h1>Write Short Notes</h1></a></font></td></tr>
			<%		
		}
	}
	else
	{
%>
	<tr>
		<td align="center">
			<font color="red">Question Paper is Not Set</font>
		</td>
	</tr>
<%
	}
%>

			
</table>

	<jsp:include page="design/lowerbody.jsp"></jsp:include>

		</body>
</html>