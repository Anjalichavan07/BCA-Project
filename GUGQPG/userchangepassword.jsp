<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Change Password</title>
	
<script language="javascript" type="text/javascript">
	history.forward();
</script>

<script type="text/javascript" language="javascript">
function change()
{
	if(form.txtcurrentpassword.value=="")
	{
		form.txtcurrentpassword.focus();
		alert("Enter Current Password");
		return false;
	}
	else if(form.txtnewpassword.value=="")
	{
		form.txtnewpassword.focus();
		alert("Enter New Password");
		return false;
	}
	else if(form.txtconifrmpassword.value=="")
	{
		form.txtconifrmpassword.focus();
		alert("Enter Confirm Password");
		return false;
	}
	else if(form.txtconifrmpassword.value!=form.txtnewpassword.value)
	{
		form.txtconifrmpassword.focus();
		alert("Confirm Password should be same ");
		return false;
	}
}
</script>
<jsp:include page="/design/head.jsp"/>
</head>

<body>
	<jsp:include page="/design/userupperbody.jsp" />
	<h2 align="left">Profile Details</h2> 
<br />

<form action="userchangepasswordupdate.jsp" name="form" method="post">
<table align="center" border="2">
	<tr>
		<td>Current Password</td>
		<td><input type="password" name="txtcurrentpassword" /></td>
	</tr>
	<tr>
		<td>New Password</td>
		<td><input type="password" name="txtnewpassword" /></td>
	</tr>
	<tr>
		<td>Confirm Password</td>
		<td><input type="password" name="txtconifrmpassword" /></td>
	</tr>
	<tr>
		<th colspan="2" align="center"><input  type="submit" onclick="return change()"value="Change Password" />&nbsp;&nbsp;&nbsp;<input type="reset" value="Cancel" /></th>
	</tr>
</table>
</form>
<br/><br/><br/>
<br/><br/><br/>
<br/><br/><br/>

	   <jsp:include page="/design/lowerbody.jsp" />
<%
	if(request.getParameter("msg")!=null && request.getParameter("msg").toString().compareTo("1")==0)
	{
		%>
			<script language="javascript" type="text/javascript">
				alert("Password Changed");
			</script>
		<%
	}
	else if(request.getParameter("msg")!=null && request.getParameter("msg").toString().compareTo("2")==0)
	{
	%>
			<script language="javascript" type="text/javascript">
				alert("Server Error Contact Administrator");
			</script>
		<%
		
	}
	else if(request.getParameter("msg")!=null && request.getParameter("msg").toString().compareTo("3")==0)
	{
	%>
			<script language="javascript" type="text/javascript">
				alert("Admin cannot change his Password");
			</script>
		<%
		
	}
%>

</body>
</html>
