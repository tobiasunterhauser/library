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


	

//preparedStatement books_user
	PreparedStatement pstBooksUser = c.prepareStatement("SELECT * FROM books_user WHERE id = ? ");

	UUID entryID = UUID.fromString(request.getParameter("entry"));
	
	pstBooksUser.setObject(1, entryID);
	ResultSet resultBooksUser = pstBooksUser.executeQuery();
	String cDate = "";
	String cidUser = "";
	String cidBook = "";
	
	if(resultBooksUser.next()){
		cDate = resultBooksUser.getString(4);
		cidUser = resultBooksUser.getString(3);
		cidBook = resultBooksUser.getString(2);
	}
	

	//PreparedStatement Users all
	PreparedStatement pstUsers = c.prepareStatement("SELECT id, name FROM users");
	

	ResultSet resultUsers = pstUsers.executeQuery();
	
	
	//PreparedStatement Books all
	PreparedStatement pstBooks = c.prepareStatement("SELECT id, title FROM books");
	
	ResultSet resultBooks = pstBooks.executeQuery();
	
	
	
	
	 
	
%>
<div class="container mt-5 text-center">

<form class="text-center" action="update.jsp" method="get">
<div>
	<input type="date" name="deadline"
      value="<%=cDate %>"
       min="2021-01-01" max="2023-12-31">
</div>
<br>

<div>
<label for="username">Benutzer auswählen</label>

<select name="username" >
  <% while(resultUsers.next()){
	
	  String id = resultUsers.getString("id");
	  if(  cidUser.equals(id)){
		  out.println("<option value='" + resultUsers.getString("id") + "' selected>" + 
				  resultUsers.getString("name") + "</option>");
	  }else{
		  out.println("<option value='" + resultUsers.getString("id") + "' >" + 
				  resultUsers.getString("name") + "</option>");
	  }
		  


  }	  %>
</select>

</div>
<br>
<div>

<label for="book">Buch auswählen</label>

<select name="book" >
   <% while(resultBooks.next()){
	   
	   String id = resultBooks.getString("id");
	   if(cidBook.equals(id)){
		   out.println("<option value='" + id  + "' selected>" + 
				   resultBooks.getString("title") + "</option>");
	   }else{
		   out.println("<option value='" + id  + "'>" + 
				   resultBooks.getString("title") + "</option>");
	   }
	
  }	  %>
  
</select>
</div>
<br>
<input type="hidden" name="id" value="<%=entryID %>">
<button class="btn btn-success" type="submit">Speichern</button>

</form>

<a href="start.jsp" class="mt-3 btn btn-danger">Go back</a>
</div>
</body>
</html>