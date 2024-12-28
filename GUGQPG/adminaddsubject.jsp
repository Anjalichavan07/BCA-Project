<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Add Subject</title>
<script language="javascript" type="text/javascript" src="myscript.js"></script>
<script type="text/javascript" language="javascript">
function check()
{
	if(register.course.value=="")
	{
		register.course.focus()
		alert(" Select Course");
		return false;
	}
	else if(register.txtsubject.value=="")
	{
		register.txtsubject.focus()
		alert(" Enter Subject.");
		return false;
	}
	else
	{
		return true;
	}
}
</script>
<jsp:include page="/design/head.jsp"/>
</head>
<body>
<jsp:include page="/design/adminupperbody.jsp" />

<form autocompleted="off" name="register" method="post" action="adminaddsubjectcode.jsp" >
<h1 align="center">Add Subject </h1><br />
<table align="center" border="1">
	<tr>
		<td> Select Course</td>
		<td>
				<select autofocus="on" name="course">
<option value="">Select Course</option>
<option value="1">BCA</option>
<option value="3">BBA</option>
<option value="2">BCOM</option>

				</select>

		</td>
	</tr>
	<tr>
		<td>Subject</td>
		<td><input type="text" name="txtsubject" onkeypress="return character(event)" /></td>
	</tr>
	<tr>
		<td colspan="2" align="center"><input type="submit" value="Add Subject"  onclick="return check()" />&nbsp;<input type="reset" value="Cancel" /></td>
	</tr>
</table>
</form>

<jsp:include page="/design/lowerbody.jsp" />

</body>

</html>
