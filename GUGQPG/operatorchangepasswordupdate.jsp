<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Change Password</title>
<script language="javascript" type="text/javascript">
	history.forward();
</script>

</head>

<body>
	<%@include file="getconnection.jsp" %>
	<%
		try
		{
		
			if(session.getAttribute("username").toString().compareTo("admin")==0)  
			{
					response.sendRedirect("operatorchangepassword.jsp?msg=3");
			}
			else
			{
				String current=request.getParameter("txtcurrentpassword");
				String newpassword=request.getParameter("txtnewpassword");
				st.executeUpdate("update tblstaffregister set password ='"+newpassword+"' where mobilenumber='"+session.getAttribute("username").toString()  +"' and password='"+current+"'");
				response.sendRedirect("operatorchangepassword.jsp?msg=1");
			}
		}
		catch(Exception exe)
		{
			System.out.print(exe);
			response.sendRedirect("operatorchangepassword.jsp?msg=2");
		}
	%>
</body>
</html>
