<%@page import="project.Conn"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.io.PrintWriter"%>
<%@page import ="project.passwordChangeEmail" %>
<%@page import ="project.User" %>

<%
String userEmail =  request.getParameter("email");
System.out.println(userEmail);



if(userEmail == ""){
	PrintWriter pw = response.getWriter();
	pw.println("<script type=\"text/javascript\">");
	pw.println("alert('Invalid EmailAddress');");
	pw.println("</script>");
	RequestDispatcher rd=request.getRequestDispatcher("ForgotPassword.jsp");
	rd.include(request, response);
}else{
	Connection con = Conn.getCon();
	Statement statement = con.createStatement();
     ResultSet myResult = statement.executeQuery("Select * from Users where email = '"+userEmail+"'");    
     if(myResult.next()){
    	String Email = userEmail;
   	  
    	passwordChangeEmail sm = new passwordChangeEmail();
   	  String code = sm.getRandom();
   	  
   	  User user = new User(Email,code); 
   	  
   	  boolean test = sm.sendpassChangeEmail(user);
   	  
   	  if(test){
   		  session.setAttribute("authcode", user);
   		session.setAttribute("Name",Email); 
   		  response.sendRedirect("EmailVeri2.jsp?msg=valid");
   	  }
     }else{
    	 PrintWriter pw = response.getWriter();
    		pw.println("<script type=\"text/javascript\">");
    		pw.println("alert('This User Is not found!');");
    		pw.println("</script>");
    		RequestDispatcher rd=request.getRequestDispatcher("ForgotPassword.jsp");
    		rd.include(request, response);
     }
}

%>
