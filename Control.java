
//import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Control
 */
@WebServlet("/Control")
public class Control extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Control() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
	    String uname=request.getParameter("t1");
	    String pwd=request.getParameter("t2");
	    //String id=request.getParameter("t3");
	   // out.println(uname);
	    //out.println(pwd);
	   // out.print(id);
	    final String url="jdbc:mysql://localhost:3306/login";
	    final String user="root";
	    final String passw="";
	    String dname=null;
	    String dpwd=null;
	    String driver = "com.mysql.jdbc.Driver";
	    //String driver = "com.mysql.cj.jdbc.Driver";
	    try {
            //out.println("Before Connection");
	    	Class.forName(driver);
	    	//out.println("Before Connection");
	    	Connection con=DriverManager.getConnection(url,user,passw);
	    	out.println("connected succesfully");
	    	Statement st=con.createStatement();
	    	String sql="select * from faculty where username='"+uname+"'";
	    	ResultSet rs=st.executeQuery(sql);
	    	 while(rs.next()) {
	    		 dname=rs.getString(2);
	    	     dpwd=rs.getString(3);
	    	     //out.println(rs.getString(1)+"   "+rs.getString(2));
	    	     
	    	 }
	    	 if(uname.equals(dname)&&pwd.equals(dpwd)) {
	 	    	RequestDispatcher rd=request.getRequestDispatcher("/mainframe.html");
	 	    	rd.forward(request, response);
	 	    }
	 	    else {
	 	    	RequestDispatcher rd=request.getRequestDispatcher("index.html");
	 	    	rd.include(request, response);
	 	    	out.println("<br><br><h3 align='center'>Incorrect username and password</h3>");
	 	    }
	    	
	    }
	    catch(Exception e) {
	    	e.printStackTrace();
	    	out.println(e);
	    	//out.println("Welcome to error handler");
	    }
	    
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}