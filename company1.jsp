<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String cmpname=request.getParameter("t5");
//out.println(regdno);
final String url="jdbc:mysql://localhost:3306/login";
final String user="root";
final String passw="";
String dregdno=null;
String dname=null;
String dcmp=null;
String dpack=null;
int a=0;

try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection(url,user,passw);
	System.out.println("connected succesfully");
	Statement st=con.createStatement();
	int sno=1;
	ResultSet rs1 = st.executeQuery("select count(*) from student where cmpname='"+cmpname+"'");
    if(!rs1.next()) {
    	 a = 0;
    }
     a=rs1.getInt("count(*)");
   
    
    if(a!=0){
	
	        String sql="select * from student where cmpname='"+cmpname+"'";
			ResultSet rs=st.executeQuery(sql);
         	out.println("<table align='center' border='1px solid green'> ");
	        out.println("<tr><th>S.no</th><th>Registration no</th><th>Name</th><th>Company</th><th>Package</th></tr>");
	        while(rs.next()) {
		 
			 dregdno=rs.getString(1);
		     dname=rs.getString(2);
		     dcmp=rs.getString(4);
		     dpack=rs.getString(5);
		    //out.println(dregdno+"   "+dname);
		     out.println("<tr><td>"+sno+"</td><td>"+dregdno+"</td><td>"+dname+"</td><td>"+dcmp+"</td><td>"+dpack+"</td></tr>");
		     sno++;
		     
	 }
	    out.println("</table>");
		 
	 }
	 /* if(cmpname.equals(dregdno)) {
	    	RequestDispatcher rd=request.getRequestDispatcher("index.html");
	    	rd.forward(request, response);
	    }*/
	 else{
	    	//RequestDispatcher rd=request.getRequestDispatcher("mainframe.html");
	    	//rd.include(request, response);
	    	out.println("<h3 align='center'>Enter companies like wipro,tcs,capgemini,infosys,hcltechbee,mphasis!!</h3>");
	    }
	
}
catch(Exception e) {}
%>
</body>
</html>