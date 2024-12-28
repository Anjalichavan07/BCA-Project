<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>Feedback</title>
		
		<jsp:include page="design/head.jsp"></jsp:include>
	</head>
	<body>
	<jsp:include page="design/userupperbody.jsp"></jsp:include>
	<h2 align="left">Feedback/Suggestions</h2> 
<br/>
<%@ include file="msg.jsp" %>
<script language="javascript" type="text/javascript">
	function check()
	{
		if(displayform.txtcadetname.value=="null")
		{
			alert("Cadet Name cant be Null!Please Relogin");
			displayform.txtfeedback.focus();
			return false;
		}
		else if(displayform.txtfeedback.value=="")
		{
			alert("Enter Feedback");
			displayform.txtfeedback.focus();
			return false;
		}
		
	}
</script>
<br/>
	<form  name="displayform" method="post" action="userfeedbackcode.jsp">
	<table align="center" border="1">
		<tr>
			<td>Cadet Name</td>
			<td>
				<input value="<%=session.getAttribute("firstname")%>" type="text" name="txtcadetname" readonly />
			</td>
			
		</tr>
		<tr>
			<td>Feedback</td>
			<td>
				<textarea name="txtfeedback" rows="5" cols="40" ></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input onclick="return check();" type="submit" name="btnsubmit" value="Submit" />
				<input type="reset" name="btncancel" value="Cancel" />
			</td>
		</tr>
	</table>
	</form>		
	<jsp:include page="design/lowerbody.jsp"></jsp:include>

		</body>
</html>