<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Admin Home</title>
<jsp:include page="design/head.jsp"></jsp:include>
</head>
<%@ include file="getconnection.jsp" %>
<body>
<jsp:include page="design/adminupperbody.jsp"></jsp:include>
<h2 align="left">Completed Papers</h2> 
<br />
<%@ include file="msg.jsp" %>
<%
	try
	{
		if(request.getParameter("mobilenumber")!=null)
		{
			String mobile=request.getParameter("mobilenumber");
			int status=Integer.parseInt(request.getParameter("status"));
			st.executeUpdate("update tblstaffregister set softdelete=0,softdelete="+status+" where mobilenumber='"+mobile+"'");
			if(status==1)
			{
				response.sendRedirect("viewprincipaldetails.jsp?msg=Principal Login Deactivated");
			}
			else
			{
				response.sendRedirect("viewprincipaldetails.jsp?msg=Principal Login Activated");
			}
			
		}
	}
	catch(Exception exe)
	{
	}
%>
<table align="center" border="1">
	<tr>
		<th>Sl. No.</th>
		<th>Full Name</th>
		<th>Email ID</th>
		<th>Mobile number</th>
		<th>Gender</th>
		<th>Status</th>
		<th>Action</th>
		
	</tr>
<%
	rs=st.executeQuery("select * from tblstaffregister where usertype=1 order by firstname");
	int sl=1;
	while(rs.next())
	{
		%>
			<tr>
				<td><%=sl++%></td>
				<td><%=rs.getString("firstname")%>&nbsp;<%=rs.getString("lastname")%></td>
				<td><%=rs.getString("emailid")%></td>
				<td><%=rs.getString("mobilenumber")%></td>
				<td><%=rs.getString("gender")%></td>
				<%
						if(rs.getInt("softdelete")==0)
						{
							%>
							<td>Active</td>	
							<td>
								<a href="viewstaffdetails.jsp?mobilenumber=<%=rs.getString("mobilenumber")%>&status=1">Deactivate</a>
							</td>
							<%
							
						}
						else if(rs.getInt("softdelete")==1)
						{
							%>
							<td>Deactive</td>	
							<td>
								<a href="viewstaffdetails.jsp?mobilenumber=<%=rs.getString("mobilenumber")%>&status=0">Activate</a>
							</td>
							<%
						}
				%>
			</tr>
		<%
	}
%>
</table>
<jsp:include page="design/lowerbody.jsp"></jsp:include>
</body>
</html>