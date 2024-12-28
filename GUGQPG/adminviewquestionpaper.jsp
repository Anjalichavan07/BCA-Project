<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Question Paper</title>
</head>

<body>
	<%@include file="getconnection.jsp" %>

<%!
	String course="",subject="";
%>
<center>
<font size="+3">Gulbarga University </font><br/>
	KALABURAGI
<%
	String qry1="select a.subjectname,b.coursename from tblquestion as c  inner join tblsubjects as a on c.testid="+Integer.parseInt(request.getParameter("id"))+" and a.subjectid=c.subject inner join tblcourse as b on c.course=b.courseid";

	rs=st.executeQuery(qry1);	
	if(rs.next())
	{
		course=rs.getString("coursename");
		subject=rs.getString("subjectname");
	}

%>
	<br/><%=course%>
	<br/>Subject:<%=subject%>
</center>
<%
		String image="";

	String qry="select a.question,a.marks,a.mainid,b.heading,a.filename from tblquestion as a  inner join tblpaperheads as b on a.testid="+Integer.parseInt(request.getParameter("id"))+" and a.mainid=b.intheadid order by a.mainid ";
	rs=st.executeQuery(qry);	
	int headid=0;
	int count=1,k=0;
	while(rs.next())
	{
		if(rs.getString("filename")!=null)
		{
			image=rs.getString("filename");
			k=1;
		}
		if(headid==0)
		{
			headid=rs.getInt("mainid");
			%>
				<li><b><%=rs.getString("heading")%></b>&nbsp;(<%=rs.getString("a.marks")%> Marks Each)</li>
			<br/>
			<%
		}
		
		if(headid!=rs.getInt("mainid"))
		{
			headid=rs.getInt("mainid");
			%>
				<br/><li><b><%=rs.getString("heading")%></b>&nbsp;(<%=rs.getString("a.marks")%> Marks Each)</li>
				
				<br/>
			<%
			count=1;
		}
			%>
				<%=count++%>) <%= rs.getString("question")%>
						<br/>
				<%
					if(k==1)
					{
						%>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="upload//<%=image%>" height="70px" width="100px" />
						<%
						k=0;
					}
				%>
				
				
				<br/>
		<%
		
	}
	rs.close();
%>

</body>
</html>
