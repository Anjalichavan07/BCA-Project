<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Answer List</title>
</head>
<%@ include file="getconnection.jsp" %>
<body>
<table align="center">
	<tr>
		<td align="center"><font face="Latha" color="red" size="+3" >Police Training College</font><br/>
		Naganahalli-Kalaburagi
		<br>
		Pincode 585103
		</td>
	</tr>
	
</table>
<hr/>
<table width="100%" border="1">
	<tr>
		<td align="center">
		<b>Chest No. :</b> <%=session.getAttribute("username")%>
		</td>
		<td align="center">
			<b>Subject:</b> <%=session.getAttribute("subject")%>
		</td>
		<td align="center">
			<b>Date:</b> <%=finaldate%>
		</td>
	</tr>
	<tr>
		<td colspan="3" align="center"><b>Course: &nbsp;</b>
		<%=session.getAttribute("course").toString()%>
		</td>
	</tr>
</table>
<br/>
	<table width="100%" border="1">
		<tr>
		</tr>
	
	<%
	if(request.getParameter("aid")!=null)
	{
	int id= Integer.parseInt(request.getParameter("aid"));
	int hh=st.executeUpdate("delete from tblanswer where answerid="+id+" and username='"+session.getAttribute("username").toString()+"'");
		if(hh==1)
		{
			%>
				<script language="javascript" type="text/javascript">
					alert("Answer Deleted");
					location.href="viewanswers.jsp";
				</script>
			<%
		}
	}
	String subject=session.getAttribute("subject").toString();
	rs=st.executeQuery("select answerid,main,submain,subjectname,answer from tblanswer where username='"+session.getAttribute("username")+"' and testdate='"+finaldate+"' and subjectname='"+subject+"' order by main,submain ");
	while(rs.next())
	{
		%>
			<tr>
				<td style="width:5%;">[<%=rs.getString("main")%>] (<%=rs.getString("submain")%>)</td>
				<td style="width:85%;"><%=rs.getString("answer")%></td>
				<td style="width:10%;"><a href="usertypeanswer.jsp?eid=<%=rs.getString("answerid")%>&main=<%=rs.getString("main")%>&submain=<%=rs.getString("submain")%>&answer=<%=rs.getString("answer")%>">Edit</a>&nbsp;&nbsp;&nbsp;
				<a href="viewanswers.jsp?aid=<%=rs.getString("answerid")%>">Delete</a></td>
		
			</tr>
	<%
	}
	%>
</table>

</body>
</html>
