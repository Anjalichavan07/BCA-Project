<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>Registered Users</title>
		
		<jsp:include page="design/head.jsp"></jsp:include>
	</head>
	<body>
	<jsp:include page="design/operatorupperbody.jsp"></jsp:include>
	<form  name="displayform" method="post">
	<h2 align="left">Select Subject to Set Paper</h2> 

	<%@include file="getconnection.jsp" %>
<table border="1" width="100%" cellspacing="10px">
	<tr>
		
					<%
							rs=st.executeQuery("select * from tblcourse order by coursename");
							while(rs.next())
							{
								%>
									<tr>
									<td width="25%" style="text-align:center;font-size:18px; ">
									<a href="staffsetpaper.jsp?courseid=<%=rs.getString("courseid")%>&coursename=<%=rs.getString("coursename")%>"><%=rs.getString("coursename").toString()%></a></td>
									<%
										if(rs.next())
										{
											%>
											<td width="25%" style="text-align:center;font-size:18px; ">
									<a href="staffsetpaper.jsp?courseid=<%=rs.getString("courseid")%>&coursename=<%=rs.getString("coursename")%>"><%=rs.getString("coursename").toString()%></a></td>
											<%
										}
									if(rs.next())
										{
											%>
											<td width="25%" style="text-align:center;font-size:18px; ">
									<a href="staffsetpaper.jsp?courseid=<%=rs.getString("courseid")%>&coursename=<%=rs.getString("coursename")%>"><%=rs.getString("coursename").toString()%></a>
									</td>
											<%
										}
										if(rs.next())
										{
											%>
											<td width="25%" style="text-align:center;font-size:18px; ">
										<a href="staffsetpaper.jsp?courseid=<%=rs.getString("courseid")%>&coursename=<%=rs.getString("coursename")%>"><%=rs.getString("coursename").toString()%></a>
											</td>
											<%
										}
									%>
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