<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>Questions</title>
		
		<jsp:include page="design/head.jsp"></jsp:include>
		<script language="javascript" type="text/javascript">
			function callClose()
			{
				close();
			}
		</script>
	</head>
	<body>
	<jsp:include page="design/operatorupperbody.jsp"></jsp:include>
	<form  name="displayform" method="post">
	<h1 align="center"> Questions</h1> <br />
<br />

	<%@include file="getconnection.jsp" %>

<%	
if(request.getParameter("value")!=null)
		{
			st.executeUpdate("delete from tblquestion where questionid='"+(request.getParameter("value"))+"'");		
			
			%>
			<script language="javascript" type="text/javascript">
			alert("Question Deleted");
			location.href="staffviewquestions.jsp";
			</script>
			<%
		}
try
{
	rs=st.executeQuery("select * from tblquestion where course='"+request.getParameter("courseid")+"' and mainid='"+request.getParameter("main")+"' order by mainid;");
	%>
	<table align="center" border="1">
	<tr>
		<th>Question</th>
		<th>Marks</th>
		<th>Entry Date</th>
		<th>Delete</th>
	</tr>
	<%
	while(rs.next())
	{
	
%>
	<tr>
			<td><%=rs.getString("question")%></td>
			<td><%=rs.getString("marks")%></td>
			<td><%=rs.getString("entrydate")%></td>
			<td>
				<a href="staffviewquestions.jsp?value=<%=rs.getString("questionid")%>">Delete</a>
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