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
		<style>
			body, html {
				height: 100%;
				margin: 0;
				font-family: Ariel, Helvetica, sans-serif;
			}
			.hero-image {
				background-image: url("https://images.unsplash.com/photo-1515378960530-7c0da6231fb1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80");
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
  				<div class="col-12">
  					<%
	  					request.getSession(false);
						if(session == null) {
							
						} else {
							String name = request.getParameter("uname"); 
							if(name == "zach.burton" || name == "cja" || name == "bdahal") {
					%>
					<h1 class="text-center" style="font-size: 45px; font-family: Arial; color: white">Administrator Issue Ticketing System</h1>
					<%
	  						} else {
	  				%>
	  				<h1 class="text-center" style="font-size: 45px; font-family: Arial; color: white">Issue Ticketing System</h1>
	  				<h3 class="text-center" style="font-family: Arial; color: white"><%out.println("Welcome " + name);%></h3>
	  				<%
	  						}
						}
  					%>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row mt-5">
				<div class="col-12 col-sm-6">
					<div class="card">
						<a href="http://localhost:8080/WebApplicationIssueTrackingSystem/IssueRequest.jsp" class="btn text-center">
							Create Issue Request
						</a>
					</div>
				</div>
				<div class="col-12 col-sm-6">
					<div class="card">
						<a href="http://localhost:8080/WebApplicationIssueTrackingSystem/Question.jsp" class="btn text-center">
							Ask Question to Administrator
						</a>
					</div>
				</div>
			</div>
			<div class="row mt-3">
				<div class="col-12 col-sm-6">
					<div class="card">
						<a href="http://localhost:8080/WebApplicationIssueTrackingSystem/DepartmentTickets.jsp" class="btn text-center">
							View Department Tickets
						</a>
					</div>
				</div>
				<div class="col-12 col-sm-6">
					<div class="card">
						<a href="http://localhost:8080/WebApplicationIssueTrackingSystem/MyTickets.jsp" class="btn text-center">
							View My Tickets
						</a>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row mt-3">
				<div class="col-12 col-sm-6">
					<div class="card">
						<a href="http://localhost:8080/WebApplicationIssueTrackingSystem/ViewAllIssueRequests.jsp" class="btn text-center">
							View All Issue Requests
						</a>
					</div>
				</div>
				<div class="col-12 col-sm-6">
					<div class="card">
						<a href="http://localhost:8080/WebApplicationIssueTrackingSystem/AddTicketAdmin.jsp" class="btn text-center">
							Add Ticket
						</a>
					</div>
				</div>
			</div>
			<div class="row mt-3">
				<div class="col-12 col-sm-6">
					<div class="card">
						<a href="http://localhost:8080/WebApplicationIssueTrackingSystem/AddIssues.jsp" class="btn text-center">
							Add Issues
						</a>
					</div>
				</div>
			</div>
		</div>
		<div class="container mt-5">
			<button class="btn btn-danger" type="button"><a style="text-decoration: none; color:white" href="http://localhost:8080/WebApplicationIssueTrackingSystem/logout.jsp">Logout</a></button>
		</div>
	</body>
</html>
