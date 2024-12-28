<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>Home</title>
		
		<jsp:include page="design/head.jsp"></jsp:include>
	</head>
	<body>
	<jsp:include page="design/staffupperbody.jsp"></jsp:include>
	<%@include file="getconnection.jsp" %>
	<%
		try
		{
		String questionid[]=request.getParameterValues("hdquestion");
		String marks[]=request.getParameterValues("txtmarks");
		String chestid=request.getParameter("chestid"),subject=request.getParameter("subject");
		String course=request.getParameter("course");
		String testdate=request.getParameter("testdate");
		String result="";	
		int marksscored=0;
			
		int i=0;
		for(i=0;i<questionid.length;i++)
		{
			//out.println(questionid[i]+"------"+marks[i]+"<br/>");		
			marksscored+=Integer.parseInt(marks[i]);
			st.executeUpdate("update tblanswer set correctiondate='"+finaldate+"',coorectionstatus='CORRECTED',score='"+marks[i]+"',questionid='"+questionid[i]+"' where username='"+chestid+"' and subjectname='"+subject+"' and coorectionstatus='NC'");
		
		}
		st.executeUpdate("insert into tblresultsheet values(null,"+chestid+",'"+subject+"','"+course+"','"+marksscored+"','"+testdate+"','"+finaldate+"','"+session.getAttribute("username")+"','"+result+"',0)");

		if(i==questionid.length)
		{
			link="staffloadcadetlist.jsp?msg=Answer Submitted&subject="+subject+"&course="+course+"&testdate="+testdate+"";
		}
		}
		catch(Exception exe)
		{
			System.out.println(exe);
			link="staffloadcadetlist.jsp?msg=Server Error";
		}
		if(link.compareTo("logout.jsp")!=0)
		{
			con.close();
			con1.close();
			response.sendRedirect(link);
		}
		
	%>
	
	<jsp:include page="design/lowerbody.jsp"></jsp:include>

		</body>
</html>