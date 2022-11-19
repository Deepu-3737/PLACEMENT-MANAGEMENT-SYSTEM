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
String branch=request.getParameter("t7");
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
	/*String sql="select * from student where regdno='"+regdno+"'";
	ResultSet rs=st.executeQuery(sql);*/
	ResultSet rs1 = st.executeQuery("select count(*) from student where branch='"+branch+"'");
	if(!rs1.next()) {
   	 a = 0;
   }
    a=rs1.getInt("count(*)");
   // out.println(a);
    //out.println(rs1.getInt("count(*)"));
    
    if(a!=0){
    String sql="select * from student where branch='"+branch+"'";
    ResultSet rs=st.executeQuery(sql);
	out.println("<table align='center' border='1px solid green'> ");
	out.println("<tr><th>S.no</th><th>Registration no</th><th>Name</th><th>company</th><th>package</th></tr>");
	 while(rs.next()) {
		 dregdno=rs.getString(1);
	     dname=rs.getString(2);
	     dcmp=rs.getString(4);
	     dpack=rs.getString(5);
	     
	     out.println("<tr><td>"+sno+"</td><td>"+dregdno+"</td><td>"+dname+"</td><td>"+dcmp+"</td><td>"+dpack+"</td></tr>");
         sno++;
	 }
	 out.println("</table>");
	 
	 out.println("<h3 align='center'>Total number of students selected = "+a+"</h3>");
    }
	 /* if(regdno.equals(dregdno)) {
		     out.println(dregdno+"   "+dname+"   "+dcmp+"   "+dpack);
	    	//RequestDispatcher rd=request.getRequestDispatcher("index.html");
	    	//rd.forward(request, response);
	    }*/
	    else {
	    	//RequestDispatcher rd=request.getRequestDispatcher("mainframe.html");
	    	//rd.include(request, response);
	        out.println("<h3 align='center'>Enter only IT Branch</h3>");
	    }
	
}
catch(Exception e) {}

%>


</body>
</html>