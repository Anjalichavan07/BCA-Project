
<%
try
{
	String subject=request.getParameter("subject");
	session.setAttribute("subject",subject);
	response.sendRedirect("usertypeanswer.jsp");
}
catch(Exception exe){}
%>