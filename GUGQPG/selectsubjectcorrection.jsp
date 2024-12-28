<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>Paper Correction</title>
		<jsp:include page="design/head.jsp"></jsp:include>
	</head>
	<body>
	<jsp:include page="design/staffupperbody.jsp"></jsp:include>
	<h2 align="left">Paper Correction</h2> 

	<%@include file="getconnection.jsp" %>
<form name="frm" method="post" action="staffloadcadetlist.jsp">
<table align="center" border="1">
	<tr>
		<td>Subject</td>
		<td>
			<select name="subject">
				<option>Select Subject</option>
			
					<%
							rs=st.executeQuery("select * from tblsubjects order by subjectname");
							while(rs.next())
							{
								%>
									<option value="<%=rs.getString("subjectname")%>"><%=rs.getString("subjectname").toUpperCase()%></option>
								<%
							}
							rs.close();
						%>
				</select>
		</td>
	</tr>
	<tr>
		<td>Course</td>
		<td>
			<select name="course">
				<option>Select Course</option>
			
					<%
							rs=st.executeQuery("select * from tblcourse where passout=0 order by coursename");
							while(rs.next())
							{
								%>
									<option value="<%=rs.getString("coursename")%>"><%=rs.getString("coursename").toUpperCase()%></option>
								<%
							}
							rs.close();
							con.close();
						%>
				</select>
		</td>
	</tr>
	<tr>
		<td>
			Test Date(dd/Mon/yyyy)
		</td>
		<td>
			<input type="text" name="testdate" />
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="submit" name="btnsubmit" value="Load Cadet List" />
			<input type="reset" name="btncancel" value="Cancel" /> 
		</td>
	</tr>
</table>		
</form>	

		<jsp:include page="design/lowerbody.jsp"></jsp:include>

		</body>
</html>