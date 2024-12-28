<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>Registered Users</title>
		
		<jsp:include page="design/head.jsp"></jsp:include>
	</head>
	<body>
	<jsp:include page="design/userupperbody.jsp"></jsp:include>
    	<%@ include file="getconnection.jsp" %>
	<%
		try
		{
				int i=0;
				String main=request.getParameter("txtmain");
				String submain=request.getParameter("txtsubmain");
				String answer=request.getParameter("txtanswer");
				String subject=session.getAttribute("subject").toString();
				String username=session.getAttribute("username").toString();
				String submit=request.getParameter("submit");
				int questionid=Integer.parseInt(request.getParameter("txtmainqid"));
				System.out.println("am ok here-1");
				
				if(submit.compareTo("Submit")==0)
				
				{
				System.out.println("am ok here-2");
				
					String sql1="select * from tblanswer where username='"+username+"' and main='"+main+"' and submain='"+submain+"' and testdate='"+finaldate+"' and subjectname='"+subject+"'";
					st=con.createStatement();
					rs=st.executeQuery(sql1);
					if(rs.next())
					{
						rs.close();
						con.close();
						session.setAttribute("msg","1");
						%>
						<script type="text/javascript" language="javascript">
							location.href="usertypeanswer.jsp";
						</script>
						<%		
					}
					else
					{
					System.out.println("am ok here-3");
				
					   	String sql="insert into tblanswer values(null,?,?,?,?,?,?,?,?,?,'NC');";
						PreparedStatement pst=con.prepareStatement(sql);	
						pst.setString(1,main);
						pst.setString(2,submain);
						pst.setString(3,answer);
						pst.setString(4,username);
						pst.setString(5,finaldate);
						pst.setString(6,"NC");
						pst.setInt(7,0);
						pst.setString(8,subject);
						pst.setInt(9,questionid);
						
						i=pst.executeUpdate();
					
					    if(i>0)
						{
							session.setAttribute("msg","2");
						%>
							<script type="text/javascript" language="javascript">
								location.href="usertypeanswer.jsp";
							</script>
						<%
						}
						else
						{
								session.setAttribute("msg","3");
								con.close();
							%>
							<script type="text/javascript" language="javascript">
								location.href="usertypeanswer.jsp";
							</script>
							<%
						 }
					}
				}
				else 
				{
					System.out.println("am in else part");
					String sql="update tblanswer set answer=? where answerid=? and main=? and submain=? and username=?   and testdate=? and coorectionstatus=? and score=? and subjectname=?;";
					PreparedStatement pst=con.prepareStatement(sql);	
					pst.setString(1,answer);
					pst.setInt(2,Integer.parseInt(request.getParameter("answerid")));
					pst.setString(3,main);
					pst.setString(4,submain);
					pst.setString(5,username);
					pst.setString(6,finaldate);
					pst.setString(7,"NC");
					pst.setInt(8,0);
					pst.setString(9,subject);
					int ii=pst.executeUpdate();
					if(ii==1)
					{
						%>
				<script type="text/javascript" language="javascript">
						alert("Answer Updated");
					location.href="usertypeanswer.jsp";
				</script>
				<%
					}					
				}
					
		}
	catch(Exception exe)
	{
		con.close();
		
			System.out.println(session.getAttribute("username")+":"+exe);
			session.setAttribute("msg","4");
					
					%>
				<script type="text/javascript" language="javascript">
					location.href="usertypeanswer.jsp";
				</script>
				<%
	}
	%>
<jsp:include page="design/lowerbody.jsp"></jsp:include>

		</body>
</html>