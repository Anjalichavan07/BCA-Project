<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Admin Home</title>
<jsp:include page="design/head.jsp"></jsp:include>
<script language="javascript" type="text/javascript">
	function staffViewPattern()
	{
		location.href="staffviewpattern.jsp";
	}
</script>
</head>

<body>
<%@include file="getconnection.jsp" %>
<jsp:include page="design/operatorupperbody.jsp"></jsp:include>
	<h2 align="left">Set Paper Pattern</h2> 

<%@include file="msg.jsp" %>

	<form name="frm" method="post" action="adminsetpapercode.jsp">
		<table align="center" border="1">
			<tr>
				<td>
					Subject
				</td>
				<td>
					<select name="subject">
						<option>Select Subject</option>
						<%
							rs=st.executeQuery("select * from tblsubjects order by subjectname");
							while(rs.next())
							{
								if(request.getParameter("subjectid")!=null)
								{
									%>
									<option selected value="<%=rs.getString("subjectid")%>">
										<%=rs.getString("subjectname")%>
									</option>
								<%
								}
								else
								{
								%>
									<option value="<%=rs.getString("subjectid")%>">
										<%=rs.getString("subjectname")%>
									</option>
								<%
								}
							}
							rs.close();
					%>
					</select>
				</td>
				<td>Course</td>
					<td colspan="3"> <select name="course">
			<option value="0">Select Course</option>
			<%
				rs=st.executeQuery("select * from tblcourse order by coursename");
				while(rs.next())
				{
					%>
						<option value="<%=rs.getString("courseid")%>"><%=rs.getString("coursename")%></option>
					<%
				}
				rs.close();
				con.close();
			%>
			</select>
			
			</td>

							</tr>
			<tr>
				<td>Max Marks</td>
				<td>
					<input maxlength="3" type="text" name="maxmarks" />
				</td>
				<td>
					Passsing Marks
				</td>
				<td>
						<input type="text" name="txtpassingmarks" maxlength="3" /> 
				</td>
			</tr>
			<tr>
				<td>Fill in the Blanks</td>
				<td>
					<input type="text" name="txtmain1" maxlength="3" />
				</td>
				<td>Apptitude</td>
				<td>
					<input type="text" name="txtmain2" maxlength="3" />
				</td>
			</tr>
			<tr>
				<td>Match the Following</td>
				<td>
					<input type="text" name="txtmain3" maxlength="3" />
				</td>
				<td>True or False</td>
				<td>
					<input type="text" name="txtmain4" maxlength="3" />
				</td>
			</tr>
			<tr>
				<td>Answer in 1 Line</td>
				<td>
					<input type="text" name="txtmain5" maxlength="3" />
				</td>
				<td>Letter or Essay</td>
				<td>
					<input type="text" name="txtmain6" maxlength="3" />
				</td>
			</tr>
			<tr>
				<td>Descriptive Answers</td>
				<td>
					<input type="text" name="txtmain7" maxlength="3" />
				</td>
				<td>Short Notes</td>
				<td>
					<input type="text" name="txtmain8" maxlength="3" />
				</td>
			</tr>
			<tr>
			<td>Test Date(dd/Mon/yyyy)</td>
					<td colspan="3">
						<input type="date" name="txttestdate" />
					</td>


			</tr>
			<tr>
				<td colspan="4" align="center">
					<input type="submit" name="btnsubmit" value="Submit" />
					<input type="reset" name="btnpattern" onClick="staffViewPattern()" value="View Pattern" />
					<input type="reset" name="btncancel" value="Cancel" />
 				</td>
			</tr>
		</table>
		
	</form>
	<br/>
		
<jsp:include page="design/lowerbody.jsp"></jsp:include>
</body>
</html>
