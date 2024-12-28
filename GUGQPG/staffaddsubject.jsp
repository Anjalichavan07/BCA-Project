<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>Add Subject</title>
		
		<jsp:include page="design/head.jsp"></jsp:include>
	</head>
	<body>
	<jsp:include page="design/operatorupperbody.jsp"></jsp:include>
	<%@include file="getconnection.jsp" %>
	<h2 align="left">Add Subject</h2> 

	<form  name="displayform" method="post" action="staffaddsubjectcode.jsp">
	<table align="center" border="1">
		<tr>
			<td>Course</td>
			<td>
				<select name="ddlcourse">
					<option value="0">Select Course</option>
					<option value="1">B.Sc.</option>
					<option value="2">B.C.A.</option>
					<option value="3">B.B.M.</option>
					<option value="4">B.Com</option>
					<option value="5">B.Ed.</option>
					<option value="6">B.A.</option>
				</select>
			</td>
		</tr>
	
		<tr>
			<td>Semester</td>
			<td><select name="ddlsemester">
					<option value="0">Select Semster</option>
					<option value="1">Semester-1</option>
					<option value="2">Semester-2</option>
					<option value="3">Semester-3</option>
					<option value="4">Semester-4</option>
					<option value="5">Semester-5</option>
					<option value="6">Semester-6</option>
					
				</select>
			</td>
		</tr>
			<tr>
			<td>Subject Name</td>
			<td><input type="text" name="txtsubjectname" maxlength="50" /></td>
		</tr>
		<tr>
			<td align="center" colspan="2">
					<input type="submit" name="btnsubmit" value="Submit" />
					<input type="reset" name="btnreset" value="Cancel" />
			</td>
		</tr>
	</table>
	</form>


	<jsp:include page="design/lowerbody.jsp"></jsp:include>

		</body>
</html>