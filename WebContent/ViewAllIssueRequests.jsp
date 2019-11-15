<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
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
				<h1 class="text-center" style="color: black;font-size: 45px;">View All Issue Requests</h1>
			</div>
		</div>
		<div class="container mt-3">
			<div class="row h-100 justify-content-center align-items-center">
				<h3 class="text-center" style="color: black;font-size: 35px;">My Issue Requests</h3>
			</div>
		</div>
		<div class="container-fluid mt-3">
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
									out.println(set.getString("status"));
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
		<div class="container mt-3">
			<div class="row h-100 justify-content-center align-items-center">
				<h3 class="text-center" style="color: black;font-size: 35px;">My Tickets</h3>
			</div>
		</div>
		<div class="container-fluid mt-3">
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
						<th>Associated Issue Request</th>
					</thead>
					<tbody>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</body>
</html>
