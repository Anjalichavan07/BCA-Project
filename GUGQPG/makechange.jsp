<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Untitled Document</title>
</head>

<body>
			<%@include file="getconnection.jsp" %>

<%
if(request.getParameter("rid")!=null)
{
		String id =(request.getParameter("rid"));
		int i=st.executeUpdate("update tbluserregister set status="+Integer.parseInt(request.getParameter("status"))+" where username='"+id+"'");
		if(i==1)
		{
			link="adminviewstudents.jsp?msg=Chest No. "+id+" Rejected";
		}
}

if(request.getParameter("id")!=null)
{
		String id =(request.getParameter("id"));
		int i=st.executeUpdate("update tbluserregister set status="+Integer.parseInt(request.getParameter("status"))+" where username='"+id+"'");
		if(i==1)
		{
			link="adminviewstudents.jsp?msg=Chest No. "+id+" Approved";
		}
		else
		{
			System.out.println("PROBLEM");
		}
}
	if(link.compareTo("logout.jsp")!=0)
	{
		con.close();
		con1.close();
		response.sendRedirect(link);
	}

%>

</body>
</html>
