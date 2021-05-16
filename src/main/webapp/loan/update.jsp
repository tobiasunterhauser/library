<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.UUID" %>
<%@ page import="java.time.LocalDate" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
</head>
<body>
<%
///Connect db
Class.forName("org.postgresql.Driver");
String url = "jdbc:postgresql://localhost:5432/library?user=postgres&password=12345678";

Connection c = DriverManager.getConnection(url);


	
	
	UUID id = UUID.fromString(request.getParameter("id"));
	UUID bookID = UUID.fromString(request.getParameter("book"));
	UUID userID = UUID.fromString(request.getParameter("username"));
	LocalDate udate = LocalDate.parse(request.getParameter("deadline"));
	
	



	//PreparedStatement pst = c.prepareStatement("SELECT datname FROM pg_database");
	PreparedStatement pst = c.prepareStatement("UPDATE  books_user  SET  book = ?, \"user\" = ?, return_date = ? WHERE id = ? ");
	pst.setObject(4, id );
	pst.setObject(1, bookID );
	pst.setObject(2, userID );
	pst.setObject(3, udate);
	pst.execute();




%>

<div class="container text-center mt-5">
<%  %>



<h3 class="color-green mb-3">Eintrag wurde aktualisiert</h3>
<a href="start.jsp" class="btn btn-success">Zurück</a>
</div>



</body>
</html>