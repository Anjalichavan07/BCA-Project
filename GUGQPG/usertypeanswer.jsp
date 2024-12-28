<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	 <%@ include file="getconnection.jsp" %>
		<title>Answer</title>
		<jsp:include page="design/head.jsp"></jsp:include>
	<script language="javascript" type="text/javascript">

		function dispLoad()
		{
			displayform.txtmain.focus();
		}
		function callAnswer()
		{
			location.href="viewanswers.jsp";
		}
		function goBack(value)
		{
			location.href="choosequestion.jsp?subject="+value;
		}
		function checkData()
		{
			if(displayform.txtmain.value=="" || displayform.txtsubmain.value=="")
			{
				displayform.txtmain.focus();
				alert("Select Question");
				return false;
			}
			else if(displayform.txtanswer.value=="")
			{
				displayform.txtanswer.focus();
				alert("Entered Answer cannot be Blank");
				return false;
			}
			
		}
		function setquestion(qid,mainid,ch,mainqid)
		{
			displayform.txtmain.value=mainid;
			displayform.txtsubmain.value=qid;
			displayform.txtsinglequestion.value=ch;
			displayform.txtmainqid.value=mainqid;
			
			displayform.txtanswer.focus();
			return false;
		}
	</script>
	</head>
	
	<body onload="return dispLoad()">
	<jsp:include page="design/userupperbody.jsp"></jsp:include>
	<div style="height:30px;">
	<center>
	<%! String msg="",main="",submain="",answer="",submit="Submit",eid="";%>
		<%
		if(request.getParameter("qt")!=null)
		{
			System.out.println("am in QT-1");
			session.setAttribute("qt",request.getParameter("qt").toString());
		System.out.println("am in QT-2");
			
		}
		
		if(request.getParameter("val")!=null)
		{
				System.out.println("am in VAL-1");
			
			session.setAttribute("val",request.getParameter("val").toString());
			System.out.println("am in VAL-2");
			
		}
		if(request.getParameter("eid")!=null)
		{
			eid=request.getParameter("eid");
			main=request.getParameter("main");
			submain=request.getParameter("submain");
			rs=st.executeQuery("select answer from tblanswer where answerid='"+eid+"'");
			if(rs.next())
			{
				answer=rs.getString(1);
			}
			rs.close();
			//answer=request.getParameter("answer");
			submit="Update";
		}
		else
		{
			eid="";
			main="";
			submain="";
			answer="";
			submit="Submit";
		}
		if(session.getAttribute("msg")!=null)
		{
			if(session.getAttribute("msg").toString().compareTo("1")==0)
				msg=("<font color='red'>Already Answered</font>");
			else if(session.getAttribute("msg").toString().compareTo("2")==0)
					msg=("Answer Submitted");
			else if(session.getAttribute("msg").toString().compareTo("3")==0)
					msg=("Try Again");
			else if(session.getAttribute("msg").toString().compareTo("4")==0)
					msg=("Server Error! Contact Administrator");
			else
					msg="";
		}
		else
		{
			msg="";
		}
			session.removeAttribute("msg");
	%>
	
		<%=msg%>
	</center>
	</div>
<table border="0">
	<tr>
		<td align="center">
	<font color="red">TEST SUBJECT:<b><%=session.getAttribute("subject").toString().toUpperCase()%></b></font>
		</td>
		<td align="center">
	<font color="red">QUESTION CATEGORY:<b><%=session.getAttribute("val").toString().toUpperCase()%></b></font>
		</td>
	</tr>
</table>

	
	<div style="height:150px;overflow:scroll;width:100%;">
	<table width="100%">
<%
		rs=st.executeQuery("select * from tblquestion where mainid='"+session.getAttribute("qt").toString()+"' and setdate='"+finaldate+"' and  course='"+session.getAttribute("course")+"' order by mainid");
		while(rs.next())
		{
			%>
				<tr>
					<td width="5%"> <a href="" onclick="return setquestion(<%=rs.getString("questionid")%>,<%=rs.getString("mainid")%>,'<%=rs.getString("question")%>',<%=rs.getString("questionid")%>)">Select</a></td>
					<td width="5%"><%=rs.getString("marks") %>Mark(s)</td>
					<td><textarea readonly style="width:100%;background-color:#FFFFFF" rows="3" ><%=rs.getString("question")%></textarea></td>
				</tr>
				
			<%			
		}
		rs.close();
%>
	</table>			
		</div>
	<form  name="displayform" action="usertypeanswercode.jsp" method="post">
	
	<input type="hidden" value="<%=eid%>" name="answerid" />
	<input type="hidden"  name="txtmainqid" />
	
	
	
		
		<table border="1" align="center">
			<tr>
					<td colspan="4" align="center">
						<textarea readonly rows="3" cols="90"  name="txtsinglequestion" ></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="4" align="center">
					<textarea  name="txtanswer"  style="text-align:left;" rows="10" cols="90">
						<%=answer%>
						</textarea>
					</td>
				</tr>
				<tr>
					<td colspan="4" align="center">
						<input style="border-style:none;background-color:#FAFAFA " onclick="return checkData()" value="<%=submit%>" name="submit" type="submit" />
						&nbsp;
				<a	href="choosequestion.jsp?subject=<%=session.getAttribute("subject").toString()%>" >Category</a>
						&nbsp;
						<a href="viewanswers.jsp" target="_blank">View Answers</a>
							

					</td>
				</tr>
		</table>
				<input  type="hidden" value="<%=main%>" name="txtmain"  />
					<input type="hidden"  name="txtsubmain" value="<%=submain%>"  />

	</form>		
	<br/>
	<jsp:include page="design/lowerbody.jsp"></jsp:include>

		</body>
</html>