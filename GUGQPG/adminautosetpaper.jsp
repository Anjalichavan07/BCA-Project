<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Auto Set Paper</title>
<jsp:include page="design/head.jsp"></jsp:include>
</head>

<body>
<jsp:include page="design/adminupperbody.jsp"></jsp:include>
	<%@include file="getconnection.jsp" %>

<%!
					
	int total=0,Low=0,High=0,check=0,Result=0,sumtotal=0,m1=0,m2=0,m3=0,m4=0,m5=0,m6=0,m7=0,m8=0;
	String subject="",course="";
	int len1=0,len2=0,len3=0,len4=0,len5=0,len6=0,len7=0,len8=0;
	int max=0,ch1=0,ch2=0,ch3=0,ch4=0,ch5=0,ch6=0,ch7=0,ch8=0;
	int q1=0,q2=0,q3=0,completed=0,q4=0,q5=0,q6=0,q7=0,q8=0;
	int question1[]=null,question2[]=null,question3[]=null,question4[]=null,question5[]=null,question6[]=null,question7[]=null,question8[]=null;
	int qarray1[]=null,qarray2[]=null,qarray3[]=null,qarray4[]=null,qarray5[]=null,qarray6[]=null,qarray7[]=null,qarray8[]=null;
	String testdatefixed="";
	String testid="";
%>
<%	
	testid=request.getParameter("paperid");
	
	rs=st.executeQuery("select * from tbltestdates where testid="+Integer.parseInt(testid)+" ");
	if(rs.next())
	{
		subject=rs.getString("subject");
		course=rs.getString("course");
		testdatefixed=rs.getString("testdate");
		completed=rs.getInt("completed");
		m1=rs.getInt("main1marks");
		m2=rs.getInt("main2marks");
		m3=rs.getInt("main3marks");
		m4=rs.getInt("main4marks");
		m5=rs.getInt("main5marks");
		m6=rs.getInt("main6marks");
		m7=rs.getInt("main7marks");
		m8=rs.getInt("main8marks");
		total=rs.getInt("maxmarks");
//check if pattern is set or not
		rs.close();
		finaldate1=finaldate1.replace("/","-");
		testdatefixed=testdatefixed.replace("/","-");
		String newfinaldate1[]=finaldate1.split("-");
String myfinaldate1=newfinaldate1[2]+"-"+newfinaldate1[1]+"-"+newfinaldate1[0];		

		if(m1==0 && m2==0 && m3==0 && m4==0 && m5==0 && m6==0 && m7==0 && m8==0)
		{
			link="adminviewpattern.jsp?msg=Marks Pattern not Submitted";
		}
		else if(completed==1)
		{
			link="adminviewpattern.jsp?msg=Question Paper is already Set";
		}
		//else if(testdatefixed.compareTo(finaldate1)==0 && time.startsWith("09:") && time.endsWith("AM"))//if all ok
		else if(testdatefixed.compareTo(myfinaldate1)==0)//if all ok
		{

			if(m1>0)
			{
				int chkcount=0;
				do
				{
					java.util.Random r = new java.util.Random();
					Low = 1;
					rs=st.executeQuery("select max(questionid) as maxq,min(questionid) as minq from tblquestion where mainid=1 and setdate='NS' and testid=-1");
					if(rs.next())
					{
						High = rs.getInt("maxq");
						Low=rs.getInt("minq");
					}
					if(High==0)
					{
							//response.sendRedirect("adminviewpattern.jsp?msg=Insufficient Questions");
					}
					rs.close();
					Result = r.nextInt(High-Low) + Low;
					int mmm=st.executeUpdate("update tblquestion set setdate='"+finaldate1+"',used=1,testid="+Integer.parseInt(testid)+" where questionid="+Result+" and mainid=1");
					rs=st.executeQuery("select count(*) from tblquestion where used=1 and mainid=1 and setdate!='NS' and testid="+Integer.parseInt(testid)+"");
					if(rs.next())
					{
						chkcount=rs.getInt(1);
						out.println(chkcount);
					}
					rs.close();
				}while(chkcount<m1);			
				
			}
			System.out.println("M1 SELECTED");
			
			if(m2>0)
			{
				int chkcount=0;
				do
				{
					java.util.Random r = new java.util.Random();
					Low = 1;
					rs=st.executeQuery("select max(questionid) from tblquestion where mainid=2 and setdate='NS' and testid=-1");
					if(rs.next())
					{
						High = rs.getInt(1);
					}
					if(High==0)
					{
							//response.sendRedirect("adminviewpattern.jsp?msg=Insufficient Questions");
					}
					Result = r.nextInt(High-Low) + Low;
					//System.out.println(Result);
					int mmm=st.executeUpdate("update tblquestion set setdate='"+finaldate1+"',used=1,testid="+Integer.parseInt(testid)+" where questionid="+Result+" and mainid=2");
					rs=st.executeQuery("select count(*) from tblquestion where used=1 and mainid=2 and setdate!='NS' and testid="+Integer.parseInt(testid)+"");
					if(rs.next())
					{
						chkcount=rs.getInt(1);
					}
					rs.close();
				}while(chkcount<m2);
				
			}
System.out.println("M2 SELECTED");

			if(m3>0)
			{
				int chkcount=0;
				do
				{
					java.util.Random r = new java.util.Random();
					Low = 1;
					rs=st.executeQuery("select max(questionid) from tblquestion where mainid=3 and setdate='NS' and testid=-1");
					if(rs.next())
					{
						High = rs.getInt(1);
					}
					if(High==0)
					{
							//response.sendRedirect("adminviewpattern.jsp?msg=Insufficient Questions");
					}
					Result = r.nextInt(High-Low) + Low;
					int mmm=st.executeUpdate("update tblquestion set setdate='"+finaldate1+"',used=1,testid="+Integer.parseInt(testid)+" where questionid="+Result+" and mainid=3");
					rs=st.executeQuery("select count(*) from tblquestion where used=1 and mainid=3 and setdate!='NS' and testid="+Integer.parseInt(testid)+"");
					if(rs.next())
					{
						chkcount=rs.getInt(1);
					}
					rs.close();
				}while(chkcount<m3);
			}
System.out.println("M3 SELECTED");

			if(m4>0)
			{
				int chkcount=0;
				do
				{
					java.util.Random r = new java.util.Random();
					Low = 1;
					rs=st.executeQuery("select max(questionid) from tblquestion where mainid=4 and setdate='NS' and testid=-1");
					if(rs.next())
					{
						High = rs.getInt(1);
					}
					if(High==0)
					{
							//response.sendRedirect("adminviewpattern.jsp?msg=Insufficient Questions");
					}
					Result = r.nextInt(High-Low) + Low;
					int mmm=st.executeUpdate("update tblquestion set setdate='"+finaldate1+"',used=1,testid="+Integer.parseInt(testid)+" where questionid="+Result+" and mainid=4");
					rs=st.executeQuery("select count(*) from tblquestion where used=1 and mainid=4 and setdate!='NS' and testid="+Integer.parseInt(testid)+"");
					if(rs.next())
					{
						chkcount=rs.getInt(1);
					}
					rs.close();
				}while(chkcount<m4);
			}
System.out.println("M4 SELECTED");

			if(m5>0)
			{
				int chkcount=0;
				do
				{
					java.util.Random r = new java.util.Random();
					Low = 1;
					rs=st.executeQuery("select max(questionid) from tblquestion where mainid=5 and setdate='NS' and testid=-1");
					if(rs.next())
					{
						High = rs.getInt(1);
					}
					if(High==0)
					{
							//response.sendRedirect("adminviewpattern.jsp?msg=Insufficient Questions");
					}
					Result = r.nextInt(High-Low) + Low;
					int mmm=st.executeUpdate("update tblquestion set setdate='"+finaldate1+"',used=1,testid="+Integer.parseInt(testid)+" where questionid="+Result+" and mainid=5");
					rs=st.executeQuery("select count(*) from tblquestion where used=1 and mainid=5 and setdate!='NS' and testid="+Integer.parseInt(testid)+"");
					if(rs.next())
					{
						chkcount=rs.getInt(1);
					}
					rs.close();
				}while(chkcount<m5);
			}
System.out.println("M5 SELECTED");

			if(m6>0)
			{
			int chkcount=0;
				do
				{
					java.util.Random r = new java.util.Random();
					Low = 1;
					rs=st.executeQuery("select max(questionid) from tblquestion where mainid=6 and setdate='NS' and testid=-1");
					if(rs.next())
					{
						High = rs.getInt(1);
					}
					if(High==0)
					{
							//response.sendRedirect("adminviewpattern.jsp?msg=Insufficient Questions");
					}
					Result = r.nextInt(High-Low) + Low;
					int mmm=st.executeUpdate("update tblquestion set setdate='"+finaldate1+"',used=1,testid="+Integer.parseInt(testid)+" where questionid="+Result+" and mainid=6");
					rs=st.executeQuery("select count(*) from tblquestion where used=1 and mainid=6 and setdate!='NS' and testid="+Integer.parseInt(testid)+"");
					if(rs.next())
					{
						chkcount=rs.getInt(1);
					}
					rs.close();
				}while(chkcount<m6);
			}
System.out.println("M6 SELECTED");

			if(m7>0)
			{
				int chkcount=0;
				do
				{
					java.util.Random r = new java.util.Random();
					Low = 1;
					rs=st.executeQuery("select max(questionid) from tblquestion where mainid=7 and setdate='NS' and testid=-1");
					if(rs.next())
					{
						High = rs.getInt(1);
					}
					System.out.println("HIGH"+High);
					if(High==0)
					{
						//response.sendRedirect("adminviewpattern.jsp?msg=Insufficient Questions");
					
					}
					
					Result = r.nextInt(High-Low) + Low;
					int mmm=st.executeUpdate("update tblquestion set setdate='"+finaldate1+"',used=1,testid="+Integer.parseInt(testid)+" where questionid="+Result+" and mainid=7");
					rs=st.executeQuery("select count(*) from tblquestion where used=1 and mainid=7 and setdate!='NS' and testid="+Integer.parseInt(testid)+"");
					if(rs.next())
					{
						chkcount=rs.getInt(1);
					}
					rs.close();
				}while(chkcount<m7);
			}
			if(m8>0)
			{
				int chkcount=0;
				do
				{
					java.util.Random r = new java.util.Random();
					Low = 1;
					rs=st.executeQuery("select max(questionid) from tblquestion where mainid=8 and setdate='NS' and testid=-1");
					if(rs.next())
					{
						High = rs.getInt(1);
					}
					if(High==0)
					{
							//response.sendRedirect("adminviewpattern.jsp?msg=Insufficient Questions");
					}
					Result = r.nextInt(High-Low) + Low;
					int mmm=st.executeUpdate("update tblquestion set setdate='"+finaldate1+"',used=1,testid="+Integer.parseInt(testid)+" where questionid="+Result+" and mainid=8");
					rs=st.executeQuery("select count(*) from tblquestion where used=1 and mainid=8 and setdate!='NS'  and testid="+Integer.parseInt(testid)+"");
					if(rs.next())
					{
						chkcount=rs.getInt(1);
					}
					rs.close();
				}while(chkcount<m8);
			}
System.out.println("M7 SELECTED");

		}
		int ii=0;
		 ii=st.executeUpdate("update tbltestdates set completed=1 where testid="+testid+"");
		if(ii==1)
		link="adminviewpattern.jsp?msg=Question Paper Set Successfully";		
		else
		link="adminviewpattern.jsp?msg=Question Paper already Set";		
		
	}
	else
	{
		link="adminviewpattern.jsp?msg=Too Early to Set Paper";
	}
	if(link.compareTo("logout.jsp")!=0)
	{
		response.sendRedirect(link);
	}
%>
<%
	total=sumtotal=m1=m2=m3=m4=m5=m6=m7=m8=0;
	testid=subject=course="";
	len1=len2=len3=len4=len5=len6=len7=len8=0;
	max=ch1=ch2=ch3=ch4=ch5=ch6=ch7=ch8=0;
	q1=q2=q3=q4=q5=q6=q7=q8=0;
	qarray1=qarray2=qarray3=qarray4=qarray5=qarray6=qarray7=qarray8=null;
	Low = High = check=0;
	question1=question2=question3=question4=question5=question6=question7=question8=null;

%>
<jsp:include page="design/lowerbody.jsp"></jsp:include>
</body>
</html>
