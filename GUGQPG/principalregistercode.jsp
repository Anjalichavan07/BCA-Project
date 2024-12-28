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
				String txtemailid=request.getParameter("txtemailid");
				String txtmobilenumber=request.getParameter("txtmobilenumber");
				String txtconfirmpassword=request.getParameter("txtconfirmpassword");
				String rbdgender=request.getParameter("rbdgender");
				String college=request.getParameter("college");
				String ddlusertype=request.getParameter("ddlusertype");
				String cc="";
				String sql1="select * from tblstaffregister where mobilenumber='"+txtmobilenumber+"'";
				st=con.createStatement();
				rs=st.executeQuery(sql1);
				
				if(rs.next())
				{
					rs.close();
					response.sendRedirect("staffregister.jsp?msg=1");
							
				}
				else
				{
					   String sql="insert into tblstaffregister values('"+txtname+"','"+lastname+"','"+txtemailid+"','"+txtmobilenumber+"','"+txtconfirmpassword+"','"+rbdgender+"','"+college+"',"+Integer.parseInt(ddlusertype)+",0)";
					   i=st.executeUpdate(sql);
					   				if(i>0)
				{
				%>
				<script type="text/javascript" language="javascript">
					alert(" Registered Successfully");
					location.href="principalregister.jsp";
				</script>
				<%
				}
				else
				{
				%>
				<script type="text/javascript" language="javascript">
					alert(" Registered Unsuccessfully");
				location.href="principalregister.jsp";
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
				location.href="principalregister.jsp";
				</script>
				<%
	}
%>

 </body>
</html>
