
<%@page import="project.Conn"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.io.PrintWriter"%>
<%@page import ="project.SendEmail" %>
<%@page import ="project.User" %>

<%

String email = request.getParameter("email");
String password =  request.getParameter("password");

if("admin@gmail.com".equals(email) && "admin".equals(password)){
	session.setAttribute("email", email);
	response.sendRedirect("Admin/page-index-1.html");
}else{
	
	int z=0;
	try{
		Connection con = Conn.getCon(); 
		Statement st = con.createStatement();
        ResultSet myResult = st.executeQuery("Select * from Users where email = '"+email+"' and  password = '"+password+"'");    
           System.out.println(myResult.toString());
            while(myResult.next()){
            	z=1;
           String Email = myResult.getString(1).toString();
           String Password = myResult.getString(2).toString();
            	
            	
            	
            	System.out.println(Email + ", " +Password);
            	request.getSession(true).setAttribute("email", email);
            	response.sendRedirect("index.jsp");
            }
            if(z==0){
            	System.out.println("User not found");
            	response.sendRedirect("Account.jsp?msg=NotExist");
           }
            myResult.close();
            st.close();
	}catch(Exception e){
		//System.out.println(e);
		e.printStackTrace();
		response.sendRedirect("Account.jsp?msg=invalid");
	}
}


%>