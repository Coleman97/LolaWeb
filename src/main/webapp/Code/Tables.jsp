<%@page import="project.Conn"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.DataSource"%>

<%
try{
	Connection con = Conn.getCon();
	Statement st = con.createStatement();
	String query = "Create Table Users(Username varchar(100),Email varchar(100)primary key,MobileNum bigint,Password nvarchar(128) NOT NULL)";
	String query2 = "Create Table Product(ID int, Name varchar(500),image varchar(100),Category Varchar(200),Description varchar(500),Comment varchar(150), Price int,active Varchar(10))";
	
	//st.execute(query);
	st.execute(query2);
	System.out.print(query);
	System.out.print(query2);
	System.out.print("Table Created");
	con.close();
}catch(Exception e){
	System.out.println(e);
}
%>