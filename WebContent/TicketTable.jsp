<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
		<title>Created Tickets</title>
	</head>
	<body>
		<%
			String ticketName = request.getParameter("_ticket_name");
			String department = request.getParameter("_department");
			String user = request.getParameter("_user");
			String description = request.getParameter("_description");
			String date = request.getParameter("date");
			String priority = request.getParameter("_priority");
		%>
		<h1 class="text-center">Created Tickets</h1>
		<div class="container-fluid mt-2">
			<div class="table-responsive">
				<table class="table table-bordered">
					<thead class="thead-light">
						<th>
							Ticket Number
						</th>
						<th>
							Ticket
						</th>
						<th>
							Ticket Creator
						</th>
						<th>
							Ticket Assigned To
						</th>
						<th>
							Department
						</th>
						<th>
							Priority
						</th>
						<th>
							Preferred Completed Date
						</th>
						<th>
							Issue Description
						</th>
					</thead>
					<tbody>
						<tr>
							<td>
								1001
							</td>
							<td>
								<%=ticketName %>
							</td>
							<td>
								Logged in User: Zach Burton
							</td>
							<td>
								<%=user %>
							</td>
							<td>
								<%=department %>
							</td>
							<td>
								<%=priority %>
							</td>
							<td>
								<%=date %>
							</td>
							<td>
								<%=description %>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</body>
</html>
