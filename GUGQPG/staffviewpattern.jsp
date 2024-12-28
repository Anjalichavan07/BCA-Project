<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>Test Patterns</title>
		
		<jsp:include page="design/head.jsp"></jsp:include>
	</head>
	<body>
	
	<jsp:include page="design/operatorupperbody.jsp"></jsp:include>
	<form  name="displayform" method="post">
	<h2 align="left">Test Patterns</h2> 
	<%@include file="getconnection.jsp" %>
	<%@include file="msg.jsp" %>
<%

try
{

	if(request.getParameter("id")!=null)
	{
		int i=st.executeUpdate("delete from tbltestdates where testid="+Integer.parseInt(request.getParameter("id"))+"");
		if(i==1)
		{
		%>
			<script language="javascript" type="text/javascript">
				alert("Test Pattern Deleted");
				location.href="staffviewpattern.jsp";
			</script>
		<%
		}
	}
}
catch(Exception exe)
{
		System.out.println(exe);
	%>
			<script language="javascript" type="text/javascript">
				alert("Server Error");
				location.href="staffviewpattern.jsp";
			</script>
		<%
}
try
{
	rs=st.executeQuery("select a.subjectname,b.coursename,c.testdate,c.maxmarks,c.passmarks,c.testid,c.completed from tblsubjects as a inner join tbltestdates as c on a.subjectid=c.subject inner join tblcourse b on c.course=b.courseid order by c.testid desc");
	%>
	<center>
	
	<table align="center" border="2">
		<tr>
			<th>Subject</th>
			<th>Course</th>
			<th>Test Date</th>
			<th>Total Marks</th>
			<th>Pass Marks</th>
			<th>Status</th>
			<th>Pattern</th>
			<th>Delete</th>
		</tr>
		<%
	while(rs.next())
	{
	
%>
	<tr>
		<td><%=rs.getString("subjectname")%></td>
		<td><%=rs.getString("coursename")%></td>
		<td><%=rs.getString("testdate")%></td>
		<td><%=rs.getString("maxmarks")%></td>
		<td><%=rs.getString("passmarks")%></td>
		<td><%
			if(rs.getInt("completed")==0)
			{
				%>
					NOT SET
				<%
			}
			else
			{
				%>
					PAPER SET
				<%
			}
		%></td>
		<td><a href="staffviewpattern.jsp?viewid=<%=rs.getString("testid")%>">Pattern</a></td>
		<td><a href="staffviewpattern.jsp?id=<%=rs.getString("testid")%>">Delete</a></td>

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
<br/>
<table border="1" align="center"> 
<%
int tes=0;	
	if(request.getParameter("viewid")!=null)
	{
		rs=st.executeQuery("select * from tbltestdates where testid="+Integer.parseInt(request.getParameter("viewid"))+"");
		while(rs.next())
		{
				if(tes==0)
				{
				%>
						<tr>
							<th>Main-1</th>
							<th>Main-2</th>
							<th>Main-3</th>
							<th>Main-4</th>
							<th>Main-5</th>
							<th>Main-6</th>
							<th>Main-7</th>
							<th >Main-8</th>
							<th></th>
							
							
						</tr>

				<%
				tes++;
				}
			%>
				<tr>
					<td><%=rs.getString("main1marks")%></td>
					<td><%=rs.getString("main2marks")%></td>
					<td><%=rs.getString("main3marks")%></td>
					<td><%=rs.getString("main4marks")%></td>
					<td><%=rs.getString("main5marks")%></td>
					<td><%=rs.getString("main6marks")%></td>
					<td><%=rs.getString("main7marks")%></td>
					<td><%=rs.getString("main8marks")%></td>
					<td><a href="staffviewpattern.jsp">Ok</a></td>
					
				</tr>	
				
			<%
		}
		rs.close();
	}
%>
</table>
</div>
	<jsp:include page="design/lowerbody.jsp"></jsp:include>

		</body>
</html>