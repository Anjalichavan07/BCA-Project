<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>Home</title>
		
		<jsp:include page="design/head.jsp"></jsp:include>
	</head>
	<body>
	<jsp:include page="design/staffupperbody.jsp"></jsp:include>
	<h2 align="left">Cadet Answer Sheet</h2> 
	<br />
	<%@include file="getconnection.jsp" %>
	<form name="frm" action="loadanswercode.jsp" method="post">
		<table border="1" align="center">
			
		<%!
			String question="",testdate="",marks="0";
		%>
	<%	int h=0;
		String cadetid=request.getParameter("cno");
		String subject=session.getAttribute("subject").toString();
		String course=session.getAttribute("course").toString();
		testdate=request.getParameter("testdate");
		rs=st.executeQuery("select * from tblresultsheet  where chestno='"+cadetid+"' and testdate='"+testdate+"' and subject='"+subject+"' and course='"+course+"' and examiner='"+session.getAttribute("username")+"'");
		if(rs.next())
		{
			link="staffloadcadetlist.jsp?msg=Paper already Corrected&subject="+subject+"&course="+course+"&testdate="+testdate+"";
		}
		else
		{
			%>
			<input type="hidden" name="chestid" value="<%=cadetid%>" />
			<input type="hidden" name="subject" value="<%=subject%>" />
			<input type="hidden" name="course" value="<%=course%>" />
			<input type="hidden" name="testdate" value="<%=testdate%>" />
			<%	
				//rs=st.executeQuery("select a.main,a.submain,a.answer,a.answerid from tblanswer as a inner join tbluserregister as b on a.subjectname='"+subject+"' and a.username='"+cadetid+"' and a.correctionstatus='NC' and b.city='"+course+"'");
				rs=st.executeQuery("select * from tblanswer where username='"+cadetid+"' and testdate='"+testdate+"' and subjectname='"+subject+"' order by main,submain");
				while(rs.next())
				{
					h=1;
					rs1=st1.executeQuery("select question,marks from tblquestion where questionid="+rs.getInt("questionid")+"");
					if(rs1.next())
					{
						question=rs1.getString("question");
						marks=rs1.getString("marks");
					}
				%>
					<input type="hidden" name="hdquestion" value="<%=rs.getInt("questionid")%>" />
				<%			
				if(rs.getString("main").compareTo("8")==0 || rs.getString("main").compareTo("7")==0 || rs.getString("main").compareTo("7")==0)  
				{
				%>
				<tr>
					<td>
					
					<b>
					[<%=rs.getString("main")%>.<%=rs.getString("submain")%>]
					)<%=question%>
					</b>
					<textarea readonly disabled style="width:100%;" rows="15">
						<%=rs.getString("answer")%>
						</textarea>
					<br/>
					Max Marks:<%=marks%>
					&nbsp;&nbsp;&nbsp;&nbsp;
					Marks Obtained : <input type="text" name="txtmarks" maxlength="2" size="2" />
					

					</td>
				</tr>
				
			<%
				
			}
			else
			{
			%>
				<tr>
					<td>
				<b>
					[<%=rs.getString("main")%>.<%=rs.getString("submain")%>]
					)<%=question%>.
					</b>
					<br/><br/>
			ANSWER :<font color="red"><%=rs.getString("answer").toUpperCase()%></font>
					<br/><br/>
				Max Marks:<%=marks%>
					&nbsp;&nbsp;&nbsp;&nbsp;
					
				Marks Obtained : <input type="text" name="txtmarks" maxlength="2" size="2" />
					</td>
				</tr>
			<%
			}
		
		}
	%>
	<tr>
		<td align="center" >
			<input type="submit" name="btnsubmit" value="Submit" />
			<input type="reset" name="btnreset" value="Cancel" />
		</td>
	</tr>
</table>
</form>
<%
}
if(h==0)
{
link="staffloadcadetlist.jsp?msg=Answer Sheet not Found&subject="+subject+"&course="+course+"&testdate="+testdate+"";
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