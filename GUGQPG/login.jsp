<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Login Form</title>


<script language="javascript" type="text/javascript" src="myscript.js"></script>
<script language="javascript" type="text/javascript">
function check()
{
	if(form1.txtusername.value=="")
	{
	alert("Enter Email ID Number");
	form1.txtusername.focus();
	return false;
	}
	else if(form1.txtpassword.value=="")
	{
	alert("Enter password");
	form1.txtpassword.focus();
	return false;
	}
	
}
	function  callscroll()
	{
		
		window.scrollTo(0, 150);
		form1.txtusername.focus();
	}

</script>
<jsp:include page="design/head.jsp"/>
</head>
<body onLoad="callscroll()">
<jsp:include page="design/upperbody.jsp" />

<form name="form1" method="post"   action="login1.jsp">
<h1 align="center">Administrator Login </h1>

<table align="center" border="1">
		<tr>
			<td>
				Email ID<font color="red">*</font>
			</td>
			<td>
				<input type="text" name="txtusername" />
			</td>
		</tr>
		<tr>
			<td>
				Password<font color="red">*</font>
			</td>
			<td>
				<input type="password" name="txtpassword" />
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" name="btnsubmit" value="Login" onClick="return check()"/>
				<input type="reset" value="Cancel" name="btncancel" />
			</td> 
		</tr>
</table>
	
</form>
<jsp:include page="design/lowerbody.jsp" />
</body>
</html>
