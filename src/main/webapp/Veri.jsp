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
	String name = session.getAttribute("name").toString();
	String email = session.getAttribute("Email").toString();
	String PhoneNo = session.getAttribute("PhoneNo").toString();
	String Password = session.getAttribute("Password").toString();
	
	if(code.equals(user.getCode())){
		response.sendRedirect("Account.jsp?msg=valid");	
		%>
		  <script type="text/javascript">
		      alert("SignUp successful. Login into you account!");
		  </script>
		<%
		 Connection con = Conn.getCon();
			String query = "insert into Users values(?,?,?,?)";
			  PreparedStatement ps = con.prepareStatement(query); 
			 	ps.setString(1,name);
			    ps.setString(2,email);
			    ps.setString(3,PhoneNo);
			    ps.setString(4,Password);
			    ps.executeUpdate();
	}else{
		response.sendRedirect("EmailVeri.jsp?msg=invalid");
		PrintWriter pw = response.getWriter();
		pw.println("<script type=\"text/javascript\">");
		pw.println("alert('Incorrect Verification Code!');");
		pw.println("</script>");
		
	}

%>