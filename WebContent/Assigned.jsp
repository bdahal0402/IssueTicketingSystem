<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
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
		<title>Assigned Issue Requests and Tickets</title>
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
		<nav class="navbar navbar-expand-sm bg-secondary navbar-dark">
		  <ul class="navbar-nav">
		    <li class="nav-item">
		      <a class="nav-link" href="http://localhost:8080/WebApplicationIssueTrackingSystem/WelcomeUser.jsp">Created Requests / Tickets</a>
		    </li>
		    <li class="nav-item active">
		      <a class="nav-link" href="http://localhost:8080/WebApplicationIssueTrackingSystem/Assigned.jsp">Assigned Requests / Tickets</a>
		    </li>
		  </ul>
		</nav>
		<div class="hero-image">
			<div class="row h-100 justify-content-center align-items-center">
  				<div class="col-12">
		  			<%	
		  				String userName = session.getAttribute("uname").toString();
						request.getSession(false);	
						int roleid = 0;
						int id = 0;
						if(session == null) {
							
						} else {
							String url = "jdbc:postgresql://ec2-54-235-246-201.compute-1.amazonaws.com/d712a16gfjlf2i";
							String username = "qpvmvoqkxifbdv";
							String password = "7bb011180f5880de08fe6c69f68647a5a8409ccc13528729b792dcdee7df9512";
							Connection con = null;
							Statement statement = null;
							try {
								con = DriverManager.getConnection(url, username, password);
								statement = con.createStatement();
							} catch (SQLException e) {
								e.printStackTrace();
							}
							ResultSet set = null;
							try {
								set = statement.executeQuery("SELECT * FROM users WHERE username = '" + userName + "'");
								while(set.next()) {
									id = set.getInt("id");
									roleid = set.getInt("roleid");
									session.setAttribute("roleid", roleid);
									session.setAttribute("id", id);
								}
							} catch(SQLException sqe) {
								sqe.printStackTrace();
							}
						}
					%>
					<h1 class="text-center" style="font-size: 45px; font-family: Arial; color: white">Assigned Issue Request & Tickets</h1>
				</div>
			</div>
		</div>
		<% if(roleid == 1) { %>
		<div class="container mt-3">
			<div class="row h-100 justify-content-center align-items-center">
				<h1 class="text-center" style="color: black;font-size: 30px;">Issue Requests</h1>
			</div>
		</div>
		<div class="container-fluid">
			<div class="table-responsive">
				<table class="table table-striped">
					<thead>
						<th>Creator</th>
						<th>Request</th>
						<th>Description</th>
						<th>Department</th>
						<th>Status</th>
					</thead>
					<tbody>
							<%
							String url = "jdbc:postgresql://ec2-54-235-246-201.compute-1.amazonaws.com/d712a16gfjlf2i";
							String username = "qpvmvoqkxifbdv";
							String password = "7bb011180f5880de08fe6c69f68647a5a8409ccc13528729b792dcdee7df9512";
							Connection con = null;
							Statement statement = null;
							try {
								con = DriverManager.getConnection(url, username, password);
								statement = con.createStatement();
							} catch (SQLException e) {
								e.printStackTrace();
							}
							ResultSet set = null;
							try {
								set = statement.executeQuery("SELECT * FROM issuerequests");
								while(set.next()) {
									String status = set.getString("status");
						%>
						<tr>
							<td>
								<%
									out.println(set.getString("username"));
								%>
							</td>
							<td>
								<%
									out.println(set.getString("request"));
								%>
							</td>
							<td>
								<%
									out.println(set.getString("description"));
								%>
							</td>
							<td>
								<%
									out.println(set.getString("department"));
								%>
							</td>
							<td>
								<%
									if(Integer.parseInt(status) == 0) {
										out.println("Not Completed");
									} else {
										out.println("Completed");
									}
								%>
							</td>
						</tr>
						<%
								}
							} catch(SQLException e) {
								e.printStackTrace();
							}
						%>
					</tbody>
				</table>
			</div>
		</div>
		<%} %>
		<div class="container mt-3">
			<div class="row h-100 justify-content-center align-items-center">
				<h1 class="text-center" style="color: black;font-size: 30px;">Assigned Tickets</h1>
			</div>
		</div>
		<div class="container-fluid">
			<div class="table-responsive">
				<table class="table table-striped">
					<thead>
						<th>Name</th>
						<th>Department</th>
						<th>Assigned To</th>
						<th>Priority</th>
						<th>Scheduled Completion Date</th>
						<th>Description</th>
						<th>Created By</th>
						<th>Status</th>
						<th>Issue Request</th>
					</thead>
					<tbody>
					
					</tbody>
				</table>
			</div>
		</div>
	</body>
</html>