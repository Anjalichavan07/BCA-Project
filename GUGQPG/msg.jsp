<div style="height:30px;">

<%
	if(request.getParameter("msg")!=null)
	{
		%>
			<center>
				<font color="green"><%= request.getParameter("msg") %></font>
			</center>
		<%
	}
%>
</div>