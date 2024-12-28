<%@page import="java.text.DateFormat" %>
<%@page import="java.text.SimpleDateFormat" %>

        <%@page import="java.sql.*" %>
    <%
			String link="logout.jsp";
	        Class.forName("org.gjt.mm.mysql.Driver");
	           Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/gugqpg","root","root@123");
	           Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/gugqpg","root","root@123");
	           
			   Statement st=con.createStatement();
			 Statement st1=con.createStatement();
			 	
			   ResultSet rs=null,rs1=null;
				java.util.Date dt=new  java.util.Date();
				String mydate1=dt.toString();
			String mydate[]=mydate1.split(" ");
			String finaldate=mydate[2]+"/"+mydate[1]+"/"+mydate[5];	
		if(mydate[1].compareTo("Jan")==0)
			{
					mydate[1]="01";
			}	
			else if(mydate[1].compareTo("Feb")==0)
			{
					mydate[1]="02";
			}
			else if(mydate[1].compareTo("Mar")==0)
			{
					mydate[1]="03";
			}
			else if(mydate[1].compareTo("Apr")==0)
			{
					mydate[1]="04";
			}
			else if(mydate[1].compareTo("May")==0)
			{
					mydate[1]="05";
			}
			else if(mydate[1].compareTo("Jun")==0)
			{
					mydate[1]="06";
			}
			else if(mydate[1].compareTo("Jul")==0)
			{
					mydate[1]="07";
			}
			else if(mydate[1].compareTo("Aug")==0)
			{
					mydate[1]="08";
			}
			else if(mydate[1].compareTo("Sep")==0)
			{
					mydate[1]="09";
			}
			else if(mydate[1].compareTo("Oct")==0)
			{
					mydate[1]="10";
			}
			else if(mydate[1].compareTo("Nov")==0)
			{
					mydate[1]="11";
			}
			else if(mydate[1].compareTo("Dec")==0)
			{
					mydate[1]="12";
			}
			DateFormat dateFormat = new SimpleDateFormat("hh:mm:ss a z");
			String formattedDateTime = dateFormat.format(dt);
			String finaldate1=mydate[2]+"/"+mydate[1]+"/"+mydate[5];	
			String formattedDateTime1[]=formattedDateTime.split(" ");
			String time=formattedDateTime1[0]+" "+formattedDateTime1[1];//mydate[3];		
							

%>

