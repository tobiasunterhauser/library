<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.UUID" %>

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

if(request.getParameter("book") != null){
	//get Parameter
	UUID bookToDelete = UUID.fromString(request.getParameter("book"));



	
	PreparedStatement pst = c.prepareStatement("DELETE  FROM books WHERE id = ?");
	pst.setObject(1, bookToDelete);
	pst.execute();
}



%>

<div class="container text-center mt-5">




<h3 class="color-green mb-3">Book  was deleted succesfully</h3>
<a href="start.jsp" class="btn btn-success">Go back</a>
</div>



</body>
</html>