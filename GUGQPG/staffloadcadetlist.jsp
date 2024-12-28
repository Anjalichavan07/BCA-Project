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
	<%@include file="msg.jsp" %>
	
	<table align="center" border="1">
		<%!
			String testdate="",subject="",course="";
		%>
<%
	try
	{
		//if(session.getAttribute("course")==null && session.getAttribute("subject")==null)
		{
			testdate=request.getParameter("testdate");
			subject=request.getParameter("subject");
			course=request.getParameter("course");
			
			session.setAttribute("course",course);
			session.setAttribute("subject",subject);
		}
		int i=1;
		String query="select a.username from tbluserregister as a where a.city='"+request.getParameter("course")+"'";
		rs=st.executeQuery(query);
		//out.println(query);
		while(rs.next())
		{
			
			%>
					<tr>
						<%
					rs1=st1.executeQuery("select count(*) from tblresultsheet where testdate='"+testdate+"' and chestno='"+rs.getString("username")+"' and subject='"+subject+"' and testdate='"+testdate+"'");
					if(!rs1.next())
					{
							
						%>
						<td align="center"><a href="loadanswers.jsp?cno=<%=rs.getString("username")%>&testdate=<%=testdate%>">CADET-<%=i++%></a></td>
						<%
					}
					else
					{
					%>
						<td align="center"><a href="loadanswers.jsp?cno=<%=rs.getString("username")%>&testdate=<%=testdate%>">CADET-<%=i++%></a></td>
						<%

					}
						if(rs.next())
						{
							
							%>
							<td align="center"><a href="loadanswers.jsp?cno=<%=rs.getString("username")%>&testdate=<%=testdate%>">CADET-<%=i++%></a></td>
							<%
						}
						if(rs.next())
						{
							%>
							<td align="center"><a href="loadanswers.jsp?cno=<%=rs.getString("username")%>&testdate=<%=testdate%>">CADET-<%=i++%></a></td>
							<%
						}
						if(rs.next())
						{
							%>
							<td align="center"><a href="loadanswers.jsp?cno=<%=rs.getString("username")%>&testdate=<%=testdate%>">CADET-<%=i++%></a></td>
							<%
						}
					%>
					</tr>
				<%
		}
	}
	catch(Exception exe){
		System.out.println(exe);
	}
%>
	</table>
	
	<jsp:include page="design/lowerbody.jsp"></jsp:include>

		</body>
</html>