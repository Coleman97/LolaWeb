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
	
	if(code.equals(user.getCode())){
		PrintWriter pw = response.getWriter();
		pw.println("<script type=\"text/javascript\">");
		pw.println("alert('Verification Done!');");
		pw.println("</script>");
		response.sendRedirect("index.jsp?msg=valid");	
	}else{
		PrintWriter pw = response.getWriter();
		pw.println("<script type=\"text/javascript\">");
		pw.println("alert('Incorrect Verification Code!');");
		pw.println("</script>");
		response.sendRedirect("EmailVeri.jsp?msg=invalid");
	}

%>