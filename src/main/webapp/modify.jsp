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


	//get Parameter
	
	UUID bookToModify = UUID.fromString(request.getParameter("book"));

	



	//PreparedStatement pst = c.prepareStatement("SELECT datname FROM pg_database");
	PreparedStatement pst = c.prepareStatement("SELECT * FROM books WHERE id = ?");
	pst.setObject(1, bookToModify);

	ResultSet result = pst.executeQuery();
	String currentID = "";
	String currentTitle = "";
	int currentYear = 0;

	if(result.next()){
		currentID = result.getString("id");
		currentTitle = result.getString("title");
		currentYear = result.getInt("year");
		
	}
%>




<section class="container text-center mt-3">

<h3 class="" mb-3">Buch bearbeiten</h3>
<form action="update.jsp" method="get">
	<p>Title <input type="text" name="title" value="<%=currentTitle %>"></p>
	<p>Jahr <input type="text" name="jahr" value="<%=currentYear %>"></p>
	
	<p><input type="hidden" name="id" value="<%=currentID %>"></p>
	<br><input class="btn btn-success" type="submit" value="speichern"></input>
	
</form>

<a href="start.jsp" class="mt-3 btn btn-danger">Go back</a>


</section>

</body>
</html>