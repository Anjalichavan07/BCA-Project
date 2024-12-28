<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Login</title>
<script language="javascript" type="text/javascript" src="myscript.js" ></script>
</head>
<body>
<%@include file="getconnection.jsp" %>
<%	
	String username= request.getParameter("txtusername");
	session.setAttribute("username",username);
	String pwd= request.getParameter("txtpassword");
	String usertype="2"; 
	int x=0;
	try
	{									
	
		
			if(username.compareTo("admin")==0 && pwd.compareTo("admin123")==0)
			{
				link=("adminhome.jsp");
			
				x=1;
			}
			else  if(usertype.compareTo("2")==0)
			{
				 rs=st.executeQuery("select * from tbluserregister where emailid='"+username+"' and password='"+pwd+"' and status=2;");
				if(rs.next())
				{
					x=1;
					session.setAttribute("course",rs.getString("city"));
					session.setAttribute("firstname",rs.getString("firstname"));
					link=("userhome.jsp");	
				}
			}
			if(x==0)
			{
					link=("login.jsp?msg=Invalid Username or Password");
			}
	}
	catch(Exception exe)
	{
		System.out.println(exe);
		link="index.jsp";
	}
	if(link.compareTo("logout.jsp")!=0)
	{
		con.close();
		response.sendRedirect(link);
	}
%>
</body>
</html>
