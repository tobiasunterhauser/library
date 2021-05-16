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



	//PreparedStatement 0 
	PreparedStatement pst = c.prepareStatement("SELECT id, name FROM users");
	

	ResultSet result = pst.executeQuery();
	
	
	//PreparedStatement 1
	PreparedStatement pst1 = c.prepareStatement("SELECT id, title FROM books");
	
	ResultSet result1 = pst1.executeQuery();
	
	LocalDate todaysDate = LocalDate.now();
	
	
%>
<div class="container mt-5 text-center">

<form class="text-center" action="create.jsp" method="get">
<div>
	<input type="date" name="deadline"
       value="<%=todaysDate %>"
       min="<%=todaysDate %>" max="2023-12-31">
</div>
<br>

<div>
<label for="cars">Buch auswählen</label>

<select name="username" >
  <% while(result.next()){
out.println("<option value='" + result.getString("id") + "'>" + 
  result.getString("name") + "</option>");

  }	  %>
</select>

</div>
<br>
<div>

<label for="cars">Benutzer auswählen</label>

<select name="book" >
   <% while(result1.next()){
out.println("<option value='" + result1.getString("id") + "'>" + 
  result1.getString("title") + "</option>");

  }	  %>
  
</select>
</div>
<br>

<button class="btn btn-success" type="submit">Hinzufügen</button>

</form>

<a href="start.jsp" class="mt-3 btn btn-danger">Abbrechen</a>
</div>
</body>
</html>