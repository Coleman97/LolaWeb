<%@page import="project.Conn"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.io.PrintWriter"%>
<%@page import ="project.SendEmail" %>
<%@page import ="project.User" %>

<%
String useer =session.getAttribute("Name").toString();
System.out.println(useer);
String Password =  request.getParameter("password");
String confirmPassword =  request.getParameter("confirm-password");

if(Password == ""){
	PrintWriter pw = response.getWriter();
	pw.println("<script type=\"text/javascript\">");
	pw.println("alert('Set password);");
	pw.println("</script>");
	RequestDispatcher rd=request.getRequestDispatcher("NewPass.jsp");
	rd.include(request, response);
}else if(!(confirmPassword.equals(Password))){
	PrintWriter pw = response.getWriter();
	pw.println("<script type=\"text/javascript\">");
	pw.println("alert('Password dont match');");
	pw.println("</script>");
	RequestDispatcher rd=request.getRequestDispatcher("NewPass.jsp");
	rd.include(request, response);
}else{

	try{
		Connection con = Conn.getCon();
		String query ="Update users set password ='"+Password+"' where email='"+useer+"'";
		Statement st = con.createStatement(); 
		st.executeUpdate(query);
		PrintWriter pw = response.getWriter();
		pw.println("<script type=\"text/javascript\">");
		pw.println("alert('Successfully Changed');");
		pw.println("</script>");
		
		response.sendRedirect("index.jsp");
	}catch(Exception e){
		e.printStackTrace();
	}
}
%>
