<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Admin Home</title>
<jsp:include page="design/head.jsp"></jsp:include>
</head>

<body>
<jsp:include page="design/adminupperbody.jsp"></jsp:include>
	<%@ include file="getconnection.jsp" %>
	<%
	try
	{
		int maxmarks=0,minmarks=0,m1=0,m2=0,m3=0,m4=0,m5=0,m6=0,m7=0,m8=0;
		String subject=request.getParameter("subject");
		String testdate=request.getParameter("txttestdate");
		
		if(request.getParameter("maxmarks").length()>0)
			maxmarks=Integer.parseInt(request.getParameter("maxmarks"));
		
		if(request.getParameter("txtpassingmarks").length()>0)
			minmarks=Integer.parseInt(request.getParameter("txtpassingmarks"));
		
		if(request.getParameter("txtmain1").length()>0)
			m1=Integer.parseInt(request.getParameter("txtmain1"));
		
		if(request.getParameter("txtmain2").length()>0)
			m2=Integer.parseInt(request.getParameter("txtmain2"));
		
		if(request.getParameter("txtmain3").length()>0)
			m3=Integer.parseInt(request.getParameter("txtmain3"));
		
		if(request.getParameter("txtmain4").length()>0)
			m4=Integer.parseInt(request.getParameter("txtmain4"));
		
		if(request.getParameter("txtmain5").length()>0)
			m5=Integer.parseInt(request.getParameter("txtmain5"));
		
		if(request.getParameter("txtmain6").length()>0)
			m6=Integer.parseInt(request.getParameter("txtmain6"));
		
		if(request.getParameter("txtmain7").length()>0)
			m7=Integer.parseInt(request.getParameter("txtmain7"));
		
		if(request.getParameter("txtmain8").length()>0)
			m8=Integer.parseInt(request.getParameter("txtmain8"));
		
		if(m1==0 && m2==0 && m3==0 && m4==0 && m5==0 && m6==0 && m7==0 && m8==0)
		{
			link=("adminsetpaper.jsp?msg=Specify atleast 1 Main Question");
		}
		if(maxmarks==0)
		{
			link=("adminsetpaper.jsp?msg=Max Marks cant be Zero");
		}
		if(minmarks==0)
		{
			link=("adminsetpaper.jsp?msg=Passing Marks cant be Zero");
		}
		if(minmarks>maxmarks)
		{
			link=("adminsetpaper.jsp?msg=Max marks cant be less then Pass Max");
		}
		if((m1+m2+m3+m4+m5+m6+m7+m8)!=maxmarks)
		{
			link=("adminsetpaper.jsp?msg=Invalid Paper Pattern");
		}
		String course=request.getParameter("course");
		int main[]=new int[8];
		int count=0;
		
		for(int i=1;i<=8;i++)
		{
			rs=st.executeQuery("select max(questionid) from tblquestion where mainid="+i+" and setdate='NS' and testid=-1");
			if(rs.next())
			{
				main[count++]= rs.getInt(1);
			}	
		}
		rs.close();
		if(main[0]>=m1 && main[1]>=m2 && main[2]>=m3 && main[3]>=m4 && main[4]>=m5 && main[5]>=m6 && main[6]>=m7 && main[7]>=m8)
		{
			int i=st.executeUpdate("insert into tbltestdates values(null,'"+subject+"','"+testdate+"',"+(maxmarks)+","+(minmarks)+","+(m1)+","+(m2)+","+(m3)+","+(m4)+","+(m5)+","+(m6)+","+(m7)+","+(m8)+",'"+finaldate+"',0,'"+course+"')");
			if(i==1)
			{
				link=("adminsetpaper.jsp?msg=Paper Pattern Set");
			}
		}
		else
		{
			link=("adminsetpaper.jsp?msg=Paper Pattern Not Set! Insufficient Questions in Bank");
		}	
	}
	catch(Exception exe)
	{
		link="adminsetpaper.jsp?msg=Server Error";
		System.out.println(exe);
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
