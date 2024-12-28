<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>Feedback</title>
		
		<jsp:include page="design/head.jsp"></jsp:include>
	</head>
	<body>
	<jsp:include page="design/userupperbody.jsp"></jsp:include>
	<h2 align="left">Feedback</h2> 
<%@ include file="getconnection.jsp" %>

<%
	try
	{
		String sql="insert into tblfeedback values(null,?,?,?,?)";
		PreparedStatement pst=con.prepareStatement(sql);
		pst.setString(1,session.getAttribute("firstname").toString());
		pst.setString(2,session.getAttribute("username").toString());
		pst.setString(3,finaldate);
		pst.setString(4,request.getParameter("txtfeedback"));
		int i=pst.executeUpdate();
		if(i==1)
		{
			link="userfeedback.jsp?msg=Thank You for Feedback/Suggestion";
		}
	}
	catch(Exception exe)
	{
		link="userfeedback.jsp?msg=Server Error!Contact Administrator";
	}
	if(link.compareTo("logout.jsp")!=0)
	{
		con.close();
		response.sendRedirect(link);
	}
%>	
	
	<jsp:include page="design/lowerbody.jsp"></jsp:include>

		</body>
</html>