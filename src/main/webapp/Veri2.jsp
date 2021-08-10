<%@page import="project.Conn"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.io.PrintWriter"%>
<%@page import ="project.SendEmail" %>
<%@page import ="project.User" %>

<%

	//HttpSession session = request.getSession();//
	User user = (User)session.getAttribute("authcode");
	
	String code = request.getParameter("authcode");
	System.out.println(user);
	System.out.println(code);
	
	if(code.equals(user.getCode())){
		response.sendRedirect("NewPass.jsp?msg=valid");	
		PrintWriter pw = response.getWriter();
		pw.println("<script type=\"text/javascript\">");
		pw.println("alert('Verification Done!');");
		pw.println("</script>");
	}else{
		response.sendRedirect("EmailVeri2.jsp?msg=invalid");
		PrintWriter pw = response.getWriter();
		pw.println("<script type=\"text/javascript\">");
		pw.println("alert('Incorrect Verification Code!');");
		pw.println("</script>");
	}

%>