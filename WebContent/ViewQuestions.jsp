<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<% if(session.getAttribute("uname") == null){
	response.sendRedirect("Home.jsp");
}
else{ %>
	<head>
		<meta charset="ISO-8859-1">
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<title>View All Tickets</title>
		<style>
			body, html {
				height: 100%;
				margin: 0;
				font-family: Ariel, Helvetica, sans-serif;
			}
			.hero-image {
				background-image: url("https://images.unsplash.com/photo-1497215842964-222b430dc094?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80");
				height: 50%;
				background-position: center;
				background-repeat: no-repeat;
				background-size: cover;
				position: relative;
				opacity: 0.7;
			}
		</style>
	</head>
	<body>
		<div class="hero-image">
			<div class="row h-100 justify-content-center align-items-center">
				<h1 class="text-center" style="color: black;font-size: 40px;">Administrator Questions</h1>
			</div>
		</div>

		<div class="container-fluid mt-3">
			<div class="table-responsive">
				<table class="table table-striped">
					<thead>
						<th>ID</th>
						<th>Email</th>
						<th>Question</th>
					</thead>
					<tbody>
						<%
							String url = "jdbc:postgresql://ec2-54-235-246-201.compute-1.amazonaws.com/d712a16gfjlf2i";
							String username = "qpvmvoqkxifbdv";
							String password = "7bb011180f5880de08fe6c69f68647a5a8409ccc13528729b792dcdee7df9512";
							Connection con = null;
							try {
								con = DriverManager.getConnection(url, username, password);
								Statement statement = con.createStatement();
								ResultSet set = statement.executeQuery("SELECT * FROM questions");
								while(set.next()) {
						%>
						<tr>
							<td>
								<%
									out.println(set.getString("id"));
								%>
							</td>
							<td>
								<%
									out.println(set.getString("email"));
								%>
							</td>
							<td>
								<%
									out.println(set.getString("question"));
								%>
							</td>
						
						</tr>
						<%
								}
							} catch(Exception e) {
								e.printStackTrace();
							}
						%>
					</tbody>
				</table>
			</div>
		</div>
		
		<div class="container mt-5">
			<button class="btn btn-danger" type="button"><a style="text-decoration: none; color:white" href="http://localhost:8080/WebApplicationIssueTrackingSystem/Home.jsp">Logout</a></button>
		</div>
	</body>
	<% } %>
</html>
