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
<meta charset="utf-8" />
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">


</head>
<body>
<% 

///Connect db
Class.forName("org.postgresql.Driver");
String url = "jdbc:postgresql://localhost:5432/library?user=postgres&password=12345678";

Connection c = DriverManager.getConnection(url);


PreparedStatement pst = c.prepareStatement("SELECT books_user.id, books.title as book, users.name As username, return_date FROM books_user " +
" INNER JOIN books ON books.id = books_user.book " +
" INNER JOIN userS ON users.id = books_user.user ORDER by return_date");

ResultSet result = pst.executeQuery();


		



%>

<header>

<nav class="navbar navbar-expand navbar-dark bg-dark">
  <a class="navbar-brand ms-2" href="#">Library</a>
 

 	<ul class="navbar-nav ms-auto me-2">
      <li class="nav-item active">
        <a class="nav-link active" href="http://localhost:8080/library/loan/start.jsp">Einträge</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="http://localhost:8080/library/books/start.jsp" >Bücher</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="http://localhost:8080/library/user/start.jsp">Benutzer</a>
      </li>
    </ul>
</nav>
</header>
<section class="text-center p-5 mb-5 bg-light">
        <h1>Ausgeliehene Bücher </h1>
    </section>

    <div class="text-center mb-5">
    
   
    <a href="add.jsp" class="btn btn-success">Eintrag hinzufügen</a>
    
        
    </div>
    <div class=" container text-center">
        <table class="table">
            <tr>
                
                <th>Buch</th>
                <th>Benutzer</th>
                <th>Ausgeliehen bis</th>
                <th></th>
                <th></th>
                
            </tr>
            <tr>
            	<%
            	while(result.next()){
            		
            		out.println("<tr>");
            		
            		out.println("<td>" + result.getString("book") + "</td>");
            		out.println("<td>" + result.getString("username") + "</td>");
            		out.println("<td>" + result.getString("return_date") + "</td>");
            		out.println("<td><a class=\"btn btn-danger\" href=\"delete.jsp?entry="+ result.getObject("id") +  "\">Löschen" + "</a></td>");
            		out.println("<td><a class=\"btn btn-secondary \" href=\"modify.jsp?entry="+ result.getObject("id") +  "\">Bearbeiten" + "</a></td>");
 					
 					
            	}
            	
            	%>
            </tr>
        </table>
    </div>
   
   






<script>


</script>




</body>
</html>