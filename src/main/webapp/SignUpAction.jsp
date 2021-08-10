<%@page import="project.Conn"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.io.PrintWriter"%>
<%@page import ="project.SendEmail" %>
<%@page import ="project.User" %>

<%

String name =  request.getParameter("Username");
String email =  request.getParameter("email");
String PhoneNo =  request.getParameter("phone");
String Password =  request.getParameter("password");


if(name == ""){
	PrintWriter pw = response.getWriter();
	pw.println("<script type=\"text/javascript\">");
	pw.println("alert('Invalid Username');");
	pw.println("</script>");
	RequestDispatcher rd=request.getRequestDispatcher("Account.jsp");
	rd.include(request, response);
}else if(email == ""){
	%>
	  <script type="text/javascript">
	      alert("Invalid Email");
	  </script>
	<%
	RequestDispatcher rd=request.getRequestDispatcher("Account.jsp");
	rd.include(request, response);
}else if(PhoneNo == ""){
	PrintWriter pw = response.getWriter();
	pw.println("<script type=\"text/javascript\">");
	pw.println("alert('Invalid PhoneNo');");
	pw.println("</script>");
	RequestDispatcher rd=request.getRequestDispatcher("Account.jsp");
	rd.include(request, response);
}else if(Password == ""){
	PrintWriter pw = response.getWriter();
	pw.println("<script type=\"text/javascript\">");
	pw.println("alert('Invalid Password');");
	pw.println("</script>");
	RequestDispatcher rd=request.getRequestDispatcher("Account.jsp");
	rd.include(request, response);
}else{

try{  
	  String Username = name;
	  String Email = email;
	  
	  SendEmail sm = new SendEmail();
	  String code = sm.getRandom();
	  
	  User user = new User(Username,Email,code); 
	  
	  boolean test = sm.sendEmail(user);
	  
	  if(test){
		  session.setAttribute("authcode", user);
		
		  session.setAttribute("name", name);
		  session.setAttribute("Email", email);
		  session.setAttribute("PhoneNo", PhoneNo);
		  session.setAttribute("Password", Password);
		  response.sendRedirect("EmailVeri.jsp?msg=valid");	
		  
	  }
	
	
	  
	 // response.sendRedirect("EmailVeri.jsp?msg=valid");
	 

	   
	  
}catch(Exception e){
	response.sendRedirect("Account.jsp?msg=invalid"); 
	System.out.println(e); 
}
}

%>