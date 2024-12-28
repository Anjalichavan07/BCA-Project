<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
<script language="javascript" type="text/javascript">
	history.forward();
</script>

    </head>
    <body>
	<%@include file="getconnection.jsp" %>
    <%
		try
		{
				int i=0;
				String txtname=request.getParameter("txtname");
				String lastname=request.getParameter("lastname");
				String username=request.getParameter("username");
				String txtemailid=request.getParameter("txtemailid");
				String txtmobilenumber=request.getParameter("txtmobilenumber");
				String txtconfirmpassword=request.getParameter("txtconfirmpassword");
				String rbdgender=request.getParameter("rbdgender");
				String city=request.getParameter("city");
					
								
				String sql1="select * from tbluserregister where username='"+username+"'";
				st=con.createStatement();
				rs=st.executeQuery(sql1);
				
				if(rs.next())
				{
					rs.close();
					response.sendRedirect("Userregister.jsp?msg=1");
							
				}
				else
				{
					   String sql="insert into tbluserregister values('"+txtname+"','"+lastname+"','"+username+"','"+txtemailid+"','"+txtmobilenumber+"','"+txtconfirmpassword+"','"+rbdgender+"','"+city+"')";
					   i=st.executeUpdate(sql);
					   				if(i>0)
				{
				%>
				<script type="text/javascript" language="javascript">
					alert(" Registered Successfully");
					location.href="Userregister.jsp";
				</script>
				<%
				}
				else
				{
				%>
				<script type="text/javascript" language="javascript">
					alert(" Registered Unsuccessfully");
				location.href="Userregister.jsp";
				</script>
				<%
				 }

				}
		}
	catch(Exception exe)
	{
		System.out.println(exe);
					%>
				<script type="text/javascript" language="javascript">
					alert(" Server Error");
				location.href="Userregister.jsp";
				</script>
				<%
	}
%>

 </body>
</html>
