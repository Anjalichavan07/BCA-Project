<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>Home</title>
		
		<jsp:include page="design/head.jsp"></jsp:include>
	<script language="javascript" type="text/javascript">
		function callViewQuestions()
		{
			location.href="staffviewquestions.jsp?subject="+displayform.hdsubject.value;
		}
			function callMe()
			{
				displayform.main.focus();
			}

	</script>
	</head>
	
	<body onfocus="return callMe()">
	<jsp:include page="design/operatorupperbody.jsp"></jsp:include>
	<b><u>Set Paper</u></b>

	<form  name="displayform" enctype="multipart/form-data" method="post" action="staffsetpapercode.jsp">
 

	<%@ include file="getconnection.jsp" %>
<%!
	String main="",main1="selected",main2="",main3="",main4="",main5="",main6="",main7="",main8="";
	String marks="";
	String course="",coursename="",subject="";
int courseid=0;
%>
<%
if(request.getParameter("courseid")!=null)
{
	courseid=Integer.parseInt(request.getParameter("courseid"));
	coursename=request.getParameter("coursename");
}
System.out.println(courseid);
	if(request.getParameter("main")!=null)
	{
		main=request.getParameter("main");
		if(main.compareTo("1")==0)
		{
			main1=" selected ";
			main2=main3=main4=main5=main6=main7=main8="";
		}
		else if(main.compareTo("2")==0)
		{
			main2=" selected ";
			main1=main3=main4=main5=main6=main7=main8="";
		}
		else if(main.compareTo("3")==0)
		{
			main3=" selected ";
			main1=main2=main4=main5=main6=main7=main8="";
		}
		else if(main.compareTo("4")==0)
		{
			main4=" selected ";
			main1=main3=main2=main5=main6=main7=main8="";
		}
		else if(main.compareTo("5")==0)
		{
			main5=" selected ";
			main1=main3=main4=main2=main6=main7=main8="";
		}
		else if(main.compareTo("6")==0)
		{
			main6=" selected ";
			main1=main3=main4=main5=main2=main7=main8="";
		}
		else if(main.compareTo("7")==0)
		{
			main7=" selected ";
			main1=main3=main4=main5=main6=main2=main8="";
		}
		else if(main.compareTo("8")==0)
		{
			main8=" selected ";
			main1=main3=main4=main5=main6=main7=main2="";
		}
		else
		{
			main1=main3=main4=main5=main6=main7=main2=main8="";
		}


		if(request.getParameter("marks")!=null)
		{
			marks=request.getParameter("marks");
		}
		else
		{
			marks="";
		}
	}
	else
	{
		main1=main3=main4=main5=main6=main7=main2=main8="";
	}
int count1=0,count2=0,count3=0,count4=0,count5=0,count6=0,count7=0,count8=0;
int count11=0,count12=0,count13=0,count14=0,count15=0,count16=0,count17=0,count18=0;

rs=st.executeQuery("select count(*) from tblquestion where mainid=1 and course="+courseid+"");
if(rs.next())
{
	count1=rs.getInt(1);	
}

rs=st.executeQuery("select count(*) from tblquestion where mainid=2  and course="+courseid+"");
if(rs.next())
{
	count2=rs.getInt(1);	
}

rs=st.executeQuery("select count(*) from tblquestion where mainid=3  and course="+courseid+"");
if(rs.next())
{
	count3=rs.getInt(1);	
}
rs=st.executeQuery("select count(*) from tblquestion where mainid=4  and course="+courseid+"");
if(rs.next())
{
	count4=rs.getInt(1);	
}

rs=st.executeQuery("select count(*) from tblquestion where mainid=5  and course="+courseid+"");
if(rs.next())
{
	count5=rs.getInt(1);	
}

rs=st.executeQuery("select count(*) from tblquestion where mainid=6  and course="+courseid+"");
if(rs.next())
{
	count6=rs.getInt(1);	
}

rs=st.executeQuery("select count(*) from tblquestion where mainid=7  and course="+courseid+"");
if(rs.next())
{
	count7=rs.getInt(1);	
}

rs=st.executeQuery("select count(*) from tblquestion where mainid=8  and course="+courseid+"");
if(rs.next())
{
	count8=rs.getInt(1);	
}
//----------------------------------used questions
rs=st.executeQuery("select count(*) from tblquestion where mainid=1 and used=1  and course="+courseid+"");
if(rs.next())
{
	count11=rs.getInt(1);	
}
rs=st.executeQuery("select count(*) from tblquestion where mainid=2  and used=1  and course="+courseid+"");
if(rs.next())
{
	count12=rs.getInt(1);	
}

rs=st.executeQuery("select count(*) from tblquestion where mainid=3  and used=1  and course="+courseid+"");
if(rs.next())
{
	count13=rs.getInt(1);	
}

rs=st.executeQuery("select count(*) from tblquestion where mainid=4  and used=1  and course="+courseid+"");
if(rs.next())
{
	count14=rs.getInt(1);	
}

rs=st.executeQuery("select count(*) from tblquestion where mainid=5  and used=1  and course="+courseid+"");
if(rs.next())
{
	count15=rs.getInt(1);	
}

rs=st.executeQuery("select count(*) from tblquestion where mainid=6  and used=1  and course="+courseid+"");
if(rs.next())
{
	count16=rs.getInt(1);	
}

rs=st.executeQuery("select count(*) from tblquestion where mainid=7  and used=1  and course="+courseid+"");
if(rs.next())
{
	count17=rs.getInt(1);	
}

rs=st.executeQuery("select count(*) from tblquestion where mainid=8  and used=1  and course="+courseid+"");
if(rs.next())
{
	count18=rs.getInt(1);	
}
%>

		<%@ include file="msg.jsp" %>
	<table align="center" border="1" width="100%">
		<tr>
			<td><b>Main:</b></td><td><select name="main">
			<option  value="0">Select Question Type</option>
			<%
				rs=st.executeQuery("select * from tblpaperheads order by heading");
				while(rs.next())
				{
					if(request.getParameter("main")!=null && request.getParameter("main").compareTo(rs.getString(1))==0)
					{
						%>
							<option selected value="<%=rs.getInt(1)%>"><%=rs.getString(2).toUpperCase()%></option>
						<%
					}
					else
					{
						%>
							<option value="<%=rs.getInt(1)%>"><%=rs.getString(2).toUpperCase()%></option>
						<%
					}
				}
			%>
				</select>
				
			</td>
		
		<td>
				<b>Marks</b>
			</td>
			<td>
				<input value="<%=marks%>" type="text" name="txtmarks" maxlength="2" size="5" />
			</td>
			
		</tr>
			<tr>
			<td>
				<b>Course</b>
			</td>
			<td >
				<font><b><%=coursename%></b></font>
				<input type="hidden" name="hdcourse" value="<%=courseid%>" />
				<input type="hidden" name="coursename" value="<%=coursename%>" />
			</td>
			
			<td>
				<b>Subject</b>
			</td>
			<td >
						<select name="subject">
			<option value="0">Select Subject</option>
			<%
				String course="0";
				if(request.getParameter("subjectname")!=null)
				{
					course=request.getParameter("subjectname");
				}
					
				rs=st.executeQuery("select * from tblsubjects where courseid='"+request.getParameter("courseid")+"' order by subjectname");
				while(rs.next())
				{
					{
						
						if(request.getParameter("subjectid")!=null && rs.getString("subjectid").compareTo(request.getParameter("subjectid"))==0)
						{
							%>
							<option selected value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>
							<%

						}
						else
						{
						%>
						<option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>
						<%
						}
					}
				}
				rs.close();
			%>
			</select>

			</td>
			 
		</tr>
		<tr>
			<td colspan="6">
				<textarea style="width:100%;" rows="5" name="txtquestion"></textarea>
			</td>
		</tr>
		<tr>
			<td>Upload Image(if Any)</td>
			<td colspan="3">
				<input type="file" name="fpupload" />
			</td>
		</tr>
		<tr>
			<td colspan="6" align="center">
			<input type="submit" name="btnsubmit" value="Submit" />
			
			<input type="reset" name="btncance" value="Cancel" />
			
			</td>
		</tr>
	</table>
	<br/>
<center>
		<a target="_blank" href="http://vikku.info/indian-language-unicode-converter/kannada-unicode-converter.html">Language Converter</a>
</center>
<br/>
	<table align="center" border="1">
	<tr>
		<th><b>Sl.</b></th>
		<th><b>Category</b></th>
		<th><b>Bank</b></th>
		<th><b>Used</b></th>
		<th><b>Unused </b></th>
		<th><b>View</b></th>
	</tr>

<%
rs=st.executeQuery("select * from tblpaperheads order by intheadid");
int run=1;
while(rs.next())
{
	rs1=st1.executeQuery("select count(*) from tblquestion where mainid="+rs.getInt(1)+"  and course="+courseid+"");
	
	if(rs1.next())
	{
		count1=rs1.getInt(1);	
	}
//out.println("select count(*) from tblquestion where mainid="+rs.getInt(1)+" and used=1 and  course="+courseid+"");
	rs1=st1.executeQuery("select count(*) from tblquestion where mainid="+rs.getInt(1)+" and used=1 and  course="+courseid+"");
	if(rs1.next())
	{
		count11=rs1.getInt(1);	
	}

%>
		<tr>
			<td><%=rs.getInt(1) %>)</td>
			<td><%=rs.getString("heading").toUpperCase()%></td>
			<td><%=count1%></td>
			<td><%=count11%></td>
			<td><%=count1-count11%></td>
			<td><a target="_blank" href="staffviewquestions.jsp?courseid=<%=courseid%>&main=<%=rs.getInt(1)%>">View</a></td>			
		</tr>
	<%
	}
	%>

	</table>
	<jsp:include page="design/lowerbody.jsp"></jsp:include>

		</body>
</html>