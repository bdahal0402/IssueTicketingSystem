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
		<title>Create an Issue Request</title>
		<script>
			$(document).ready(function() {
				$("#createTicket").on("submit", function() {
					var priority = $("#priority").val();
					var user = $("#user").val();
					var department = $("#department").val();
				});
			});
		</script>
	</head>
	<body>
		<div class="container">
			<h1 class="text-center">Create an Issue Request</h1>
			<form class="form_control mt-2" id="createTicket" action="IssueRequest" method="post">
				<div class="row">
					<div class="col-12 col-sm-6">
						<label>Request</label>
						<input type="text" class="form-control" name="request" id="request" required />
					</div>
					<div class="col-12 col-sm-6">
						<label>Department</label><br />
						<select class="form_control" name="department" id="department" required>
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
						<Label>Issue Request Description</Label>
						<textarea name="description" class="form-control" required></textarea>
					</div>
				</div>
				<button type="submit" class="form-control btn btn-success mt-3">Create Issue Request</button>
			</form>
		</div>
		<div id="error"></div>
	</body>
</html>
