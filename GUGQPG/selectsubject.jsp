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
	<h2 align="left">Select Subject</h2> 

	<%@include file="getconnection.jsp" %>

<table border="1" align="center" >
	<tr>
		
					<%
							rs=st.executeQuery("select * from tblsubjects order by subjectname");
							while(rs.next())
							{
								%>
								<tr>
									<th style="text-align:left;font-size:18px; ">
										<a href="choosequestion.jsp?subject=<%=rs.getString("subjectname")%>"><%=rs.getString("subjectname").toString()%></a>
									</th>
								</tr>
								<%
							}
							rs.close();
							con.close();
						%>
</table>

	<jsp:include page="design/lowerbody.jsp"></jsp:include>

		</body>
</html>