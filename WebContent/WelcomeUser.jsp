<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<title>Welcome</title>
	</head>
	<body>
	<h1 class="text-center">Welcome To Your Issue Ticketing Portal</h1><br><br>
		<div class="container">
			<h3 class="text-center">You are now logged in to the Issue Tracking System.</h3>
			<%
				request.getSession(false);
				if(session == null) {
			%>
					<a href="http://localhost:8080/WebApplicationIssueTrackingSystem/Home.jsp">Home</a>
					<a href="http://localhost:8080/WebApplicationIssueTrackingSystem/login.jsp">Login</a>
			<%
				} else {
					// Already created
			%>
					<a href="http://localhost:8080/WebApplicationIssueTrackingSystem/logout.jsp">Logout</a>
			<%
				}
				String name = request.getParameter("uname");
			%>
			<br><br>
			<%
				System.out.println("Welcome: " + name);
			%>
		</div>
	</body>
</html>