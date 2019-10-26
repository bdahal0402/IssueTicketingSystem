<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<meta charset="ISO-8859-1">
		<title>Create a Ticket</title>
		<script>
			$(document).ready(function() {
				$("#createTicket").on("submit", function() {
					var priority = $("#priority").val();
					var user = $("#user").val();
					var department = $("#department").val();
					if(priority == "") {
						alert("Priority is required. ");
					} else if(user == "") {
						alert("This ticket needs to be assigned to a staff member. ");
					} else if(department == "") {
						alert("Department is required. ");
					} 
				});
			});
		</script>
	</head>
	<body>
		<div class="container">
			<h1 class="text-center">Create a Ticket</h1>
			<form class="form_control mt-2" id="createTicket" action="TicketTable.jsp" method="post">
				<div class="row">
					<div class="col-12 col-sm-6">
						<label>Ticket Name</label>
						<input type="text" class="form-control" name="_ticket_name" id="ticket_name" required />
					</div>
					<div class="col-12 col-sm-6">
						<label>Department</label><br />
						<select class="form_control" name="_department" id="department" required>
							<option value="">Choose a Department</option>
							<option value="Technology">Technology</option>
							<option value="Human Resources">Human Resources</option>
							<option value="Business Services">Business Services</option>
							<option value="Public Relations">Public Relations</option>
							<option value="Marketing Department">Marketing Department</option>
							<option value="Executive">Executive</option>
							<option value="Sales Department">Sales Department</option>
							<option value="Purchase Department">Purchase Department</option>
						</select>
					</div>
				</div>
				<div class="row pt-3">
					<div class="col-12 col-sm-6">
						<label>Assigned To</label><br />
						<select class="form_control" name="_user" id="user" required>
							<option value="">Assign to a Staff Member</option>
							<option value="Zachary Burton">Zachary Burton</option>
							<option value="Bimal Dahal">Bimal Dahal</option>
						</select>
					</div>
					<div class="col-12 col-sm-6">
						<Label>Priority</Label><br />
						<select class="form_control" name="_priority" id="priority" required>
							<option value="">Choose a Priority</option>
							<option value="Urgent">Urgent</option>
							<option value="High">High</option>
							<option value="Medium">Middle</option>
							<option value="Low">Low</option>
						</select>
					</div>
				</div>
				<div class="row pt-3">
					<div class="col-12 col-sm-6">
						<label>Preferred Completed Date</label>
						<input type="date" name="date" class="form-control" required />
					</div>
					<div class="col-12 col-sm-6">
						<Label>Issue Description</Label>
						<textarea name="_description" class="form-control" required></textarea>
					</div>
				</div>
				<button type="submit" class="form-control btn btn-success mt-3">Create Ticket</button>
			</form>
		</div>
		<div id="error"></div>
	</body>
</html>
