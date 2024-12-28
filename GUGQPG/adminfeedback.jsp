<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Cadet Feedback</title>
<jsp:include page="design/head.jsp"></jsp:include>
</head>

<body>
<jsp:include page="design/adminupperbody.jsp"></jsp:include>
	<%@ include file="getconnection.jsp" %>
	<%
	
		if(request.getParameter("id")!=null)
		{
			int i=st.executeUpdate("delete from tblfeedback where feedbackid="+Integer.parseInt(request.getParameter("id"))+"");
			if(i==1)
			{
				%>
					<script language="javascript" type="text/javascript">
						alert("Feedback Deleted");
						location.href="adminfeedback.jsp";
					</script>
				<%
				
			}
		}
		
		%>
		<%@ include file="msg.jsp" %>
	<br/>
	<table align="center" border="1">
		<tr>
			<th>Sl. No.</th>
			<th>Cadet Name</th>
			<th>Chest No.</th>
			<th>Feedback Date</th>
			<th>Feedback</th>
			<th>Delete</th>

		</tr>
	<%
	try
	{
		rs=st.executeQuery("select * from tblfeedback order by feedbackid desc");
		int i=1;
		while(rs.next())
		{
			%>
				<tr>
					<td><%=i++%></td>
					<td><%=rs.getString("firstname")%></td>
					<td><%=rs.getString("username")%></td>
					<td><%=rs.getString("feedbackdate")%></td>
					<td><%=rs.getString("feedback")%></td>
					<td>
						<a href="adminfeedback.jsp?id=<%=rs.getString("feedbackid")%>">X</a>
					</td>
				</tr>
			<%
		}
		rs.close();
		con.close();
	}
	catch(Exception exe){
		System.out.println(exe);
		
	}
	%>

	</table>
	
<jsp:include page="design/lowerbody.jsp"></jsp:include>
<%
	if(link.compareTo("logout.jsp")!=0)
	{
		response.sendRedirect(link);
	}
%>
</body>
</html>
