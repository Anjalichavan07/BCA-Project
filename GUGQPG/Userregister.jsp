<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>User Register</title>
<script language="javascript" type="text/javascript" src="myscript.js"></script>
<script type="text/javascript" language="javascript">
function check()
{
	if(register.txtname.value=="")
	{
		register.txtname.focus()
		alert(" Enter First Name");
		return false;
	}
	else if(register.username.value=="")
	{
		register.username.focus()
		alert(" Enter Username");
		return false;
	}
	else if(register.txtemailid.value=="")
	{
		register.txtemailid.focus()
		alert(" Enter Email ID");
		return false;
	}
	else if(register.txtmobilenumber.value=="")
	{
		register.txtmobilenumber.focus()
		alert(" Enter Mobile Number");
		return false;
	}
	else if(register.txtmobilenumber.value.length<10)
	{
		register.txtmobilenumber.focus()
		alert(" Enter Valid Mobile Number ");
		return false;
	}
	else if(register.txtpassword.value=="")
	{
		register.txtpassword.focus()
		alert(" Enter Password");
		return false;
	}
	else if(register.txtpassword.value.length<4)
	{
		register.txtpassword.focus()
		alert(" Password Must minimum be 4 characters");
		return false;
	}
	else if(register.txtconfirmpassword.value=="")
	{
		register.txtconfirmpassword.focus()
		alert(" Enter Confirm Password");
		return false;
	}
	else if(register.txtconfirmpassword.value!=register.txtpassword.value)
	{
		register.txtconfirmpassword.focus()
		alert(" Passwords Must Match");
		return false;
	}
	else if(register.city.value=="")
	{
		register.city.focus()
		alert(" Select Designation");
		return false;
	}
}
	function  callscroll()
	{
		
		window.scrollTo(0, 150);
		register.txtname.focus();
	}

</script>
<jsp:include page="/design/head.jsp"/>
</head>
<body onLoad="callscroll()">
<jsp:include page="/design/upperbody.jsp" />
<h1 align="center">Cadet Registration</h1>

<form name="register" method="post" action="userregistrationcode.jsp" >

<table align="center" border="1" >
	<tr>
		<td> First Name<br/></td>
		<td><input type="text"  name="txtname" onkeypress="return character(event)" /></td>
	</tr>
	<tr>
		<td>Last Name</td>
		<td><input type="text" name="lastname" onkeypress="return character(event)" /></td>
	</tr>
	<tr>
		<td>Chest No.</td>
		<td><input type="text" name="username" onkeypress="return number(event)"  /></td>
	</tr>
	<tr>
		<td>Email ID</td>
		<td><input type="text" name="txtemailid"  /></td>
	</tr>
	<tr>	
		<td>Mobile Number</td>
		<td><input type="text" name="txtmobilenumber"  maxlength="10" onkeypress="return number(event)" /></td>
	</tr>
	<tr>
		<td>Password</td>
		<td><input type="password" name="txtpassword" /></td>
	</tr>
	<tr>
		<td>Confirm Password</td>
		<td><input type="password" name="txtconfirmpassword" /></td>
	</tr>
	<tr>
		<td>Gender</td>
		<td><input checked type="radio" name="rbdgender"  value="Male"/>Male &nbsp;<input type="radio" name="rbdgender"  value="Female"/>Female</td>
	</tr>
		<tr>
		<td>Course Selected</td>
		<td> 
		<select name="city">
			<option value="0">Select Course</option>
			<%@include file="getconnection.jsp" %>
			<%
				rs=st.executeQuery("select * from tblcourse order by coursename");
				while(rs.next())
				{
					%>
						<option><%=rs.getString(2)%></option>
					<%
				}
				rs.close();
				con.close();
			%>
			</select>
			
			</td>
	</tr>
	<tr>
		<td colspan="2" align="center"><input type="submit" value="Register"  onclick="return check()" />&nbsp;<input type="reset" value="Cancel" /></td>
	</tr>
</table>
<br />
<br />
</form>
<jsp:include page="/design/lowerbody.jsp" />

<%
	
	if(request.getParameter("msg")!=null && request.getParameter("msg").toString().compareTo("1") ==0)
	{
		
%>
<script language="javascript" type="text/javascript">
	alert("Username already occupied!Try another");
	location.href="Userregister.jsp";
</script>
<%
	}
%>
</body>

</html>
