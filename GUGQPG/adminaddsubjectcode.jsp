<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@include file="getconnection.jsp" %>
	<%
	String course=request.getParameter("course");
	String txtsubject=request.getParameter("txtsubject");
	PreparedStatement  pst=con.prepareStatement("select count(*) as totcount from tblsubjects where subjectname=? and courseid=?");		
		pst.setString(1,txtsubject);
		pst.setString(2,course);
	int i=0;
 rs=pst.executeQuery();
	if(rs.next())
	{
		if(rs.getString("totcount")!=null)
		{
		
		if(rs.getInt("totcount")==0)
		{
	 pst=con.prepareStatement("insert into tblsubjects values(null,?,?)");
		pst.setString(1,txtsubject);
		pst.setString(2,course);
		 i=pst.executeUpdate();
		}
				else{

			%>
				<script type="text/javascript">
					alert("Subject already Exists");
					location.href="adminaddsubject.jsp";
				</script>
			<%
			
		}

	}
		else{

			%>
				<script type="text/javascript">
					alert("Subject already Exists");
					location.href="adminaddsubject.jsp";
				</script>
			<%
			
		}
	}
	

		if(i==1)
		{
			%>
				<script type="text/javascript">
					alert("Subject Added");
					location.href="adminaddsubject.jsp";
				</script>
			<%
		}
	
%>