<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
</head>
<body>


<div class="container text-center mt-5">




<h3 class="" mb-3">Neues Buch</h3>
<form action="create.jsp" method="get">
	<p>Title<input type="text" name="title"></input></p>
	<p>Jahr<input type="text" name="jahr"></input></p>
	<br><input class="btn btn-success" type="submit" value="speichern"></input>
	
</form>

<a href="start.jsp" class="mt-3 btn btn-danger">Go back</a>
</div>



</body>
</html>