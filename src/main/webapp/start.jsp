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


PreparedStatement pst = c.prepareStatement("SELECT id, title, year FROM books");
ResultSet result = pst.executeQuery();


		



%>
<header class="text-center p-5 mb-5 bg-light">
        <h1>Bücher - Übersicht</h1>
    </header>

    <div class="text-center mb-5">
    <%
    out.println("<a href=\"add.jsp\" class=\"btn btn-success\">Buch hinzufügen</a>");
    %>
        
    </div>
    <div class=" container text-center">
        <table class="table">
            <tr>
                
                <th>Title</th>
                <th>Jahr</th>
                <th></th>
                <th></th>
            </tr>
            <tr>
            	<%
            	while(result.next()){
            		
            		out.println("<tr>");
            		
            		out.println("<td>" + result.getString("title") + "</td>");
            		out.println("<td>" + result.getString("year") + "</td>");
            		out.println("<td><a class=\"btn btn-danger\" href=\"delete.jsp?book="+ result.getObject("id") +  "\">Löschen" + "</a></td>");
            		out.println("<td><a class=\"btn btn-secondary \" href=\"modify.jsp?book="+ result.getObject("id") +  "\">Bearbeiten" + "</a></td>");
 					//out.println("<td><button class=\"btn btn-danger\">Löschen</button></td>");
 					
            	}
            	
            	%>
            </tr>
        </table>
    </div>
   
   






<script>


</script>




</body>
</html>