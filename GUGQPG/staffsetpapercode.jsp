<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>  
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="org.apache.commons.net.ftp.FTP"%>
<%@ page import="org.apache.commons.net.ftp.FTPClient"%>
<%@ page import="java.io.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>Home</title>
		
		<jsp:include page="design/head.jsp"></jsp:include>
			</head>
	<body >
	<jsp:include page="design/staffupperbody.jsp"></jsp:include>
		
	<%@include file="getconnection.jsp" %>
	<%
	try
	{
		String ftpfilepath="C:/Tomcat 6.0/webapps/GUGQPG/upload/";
				
		MultipartRequest m = new MultipartRequest(request, ftpfilepath,(5 * 1024 * 1024),new DefaultFileRenamePolicy( ));
		String choose = m.getFilesystemName("fpupload");
		String submain="";
		String subjectname=m.getParameter("subject");
		String main=m.getParameter("main");
		String subject=m.getParameter("subject");
		String question=m.getParameter("txtquestion");
		String username=session.getAttribute("username").toString();
		String course=m.getParameter("hdcourse");
		String coursename=m.getParameter("coursename");
		String hdcourse=m.getParameter("hdcourse");
		int marks=Integer.parseInt(m.getParameter("txtmarks"));
		String questiondate=finaldate;
		PreparedStatement  pst=con.prepareStatement("insert into tblquestion values(null,?,?,?,?,?,?,?,?,?,0,'NS',-1)");
		pst.setString(1,main);
		pst.setString(2,submain);
		pst.setString(3,subject);
		pst.setString(4,question);
		pst.setInt(5,marks);
		pst.setString(6,questiondate);
		pst.setString(7,username);
		pst.setString(8,course);
		pst.setString(9,choose);
		int i=pst.executeUpdate();
		if(i==1)
		{
			out.println("am done");
			link="staffsetpaper.jsp?msg=Question Added&subjectid="+subject+"&marks="+marks+"&main="+main+"&subjectname="+subjectname+"&coursename="+coursename+"&courseid="+hdcourse;
		}
	}
	catch(Exception exe)
	{
		System.out.println(exe);
			link="staffsetpaper.jsp?msg=Server Error";
	}
	if(link.compareTo("logout.jsp")!=0)
	{
		con.close();
		response.sendRedirect(link);
	}
	%>
	<jsp:include page="design/lowerbody.jsp"></jsp:include>

		</body>
</html>