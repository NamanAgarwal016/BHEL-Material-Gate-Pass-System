<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
    // avoiding URL bypass
    
       String validUser= (String) session.getAttribute("userName");
         
           if(validUser==null)
           response.sendRedirect("gatepass_login.jsp");

%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Material Gate Pass - Approval Portal</title>

<!-- Adding Bootstrap CSS -->

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css"
	integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ"
	crossorigin="anonymous">


<link rel="stylesheet" href="css/approvalForm.css">

</head>
<body>


	<!-- Adding the Navigation Bar -->


	<nav class="navbar navbar-toggleable navbar-inverse">
		<button class="navbar-toggler" data-toggle="collapse"
			data-target="#mainNav">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNavDropdown">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link"
					href="gatepass_status.jsp">HOME <span class="sr-only">(current)</span></a>
				</li>
				<li class="nav-item"><a class="nav-link"
					href="gatepass_raise.jsp">RAISE GATE PASS</a></li>
				<li class="nav-item dropdown  active"><a
					class="nav-link dropdown-toggle" href="#"
					id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> VIEW </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item" href="gatepass_approved.jsp">Approved</a>
						<a class="dropdown-item" href="gatepass_closed.jsp">Closed</a> <a
							class="dropdown-item" href="gatepass_pending.jsp">Pending</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="gatepass_cancelled.jsp">Cancelled</a>
						<a class="dropdown-item" href="gatepass_inDraft.jsp">In Draft</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="gatepass_approval_portal.jsp">Approve
							Pending Requests</a>
					</div></li>
				<li class="nav-item"><a class="nav-link"
					href="gatepass_print.jsp">PRINT</a></li>
				<li class="nav-item"><a class="nav-link"
					href="gatepass_help.jsp">HELP</a></li>
			</ul>
		</div>

		<form name="logout_button"
			action="<%=request.getContextPath()%>/logout" method="get"
			align="right">
			<input class="btn btn-sign-out" type="submit" value="Sign Out">
		</form>
	</nav>
	<div class="container" id="gatepassFinder">
		<table align="center" class="table">
			<thead>
				<tr>
					<th scope="col" colspan="2" class="headerLeaf">GATE PASS
						APPROVAL</th>

				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="text-right">Select Gate Pass Number:</td>
					<td class="text-left">
						<form action="preview.php">
							<input type="number" name="gatePassNo">
						</form>
					</td>
				</tr>
				<tr class="text-center">
					<td colspan="2"><button class="btn btn-primary">Submit</button></td>
				</tr>

			</tbody>
		</table>
	</div>


	<div class="container gatepassDetails">
		<table class="table">
			<thead>
				<tr>
					<th colspan="5" class="headerLeaf">GATE PASS DETAILS</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>Gateapass Number:</th>
					<td></td>
					<td class="blank"></td>
					<th>Initiated:</th>
					<td></td>
				</tr>
				<tr>
					<th>Sl. No</th>
					<th>Material Details</th>
					<th>Quantity</th>
					<th>Unit</th>
					<th>Date of Return</th>
				</tr>
				<tr>
					<td>1</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>2</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>3</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>4</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>

				</tr>
				<tr>
					<td>5</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>

				</tr>
				<tr>
					<td>6</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>

				</tr>
				<tr>
					<th colspan="5" class="headerLeaf">RECEIVER'S INFO</th>
				</tr>
				<tr>
					<th>Name:</th>
					<td></td>
					<td class="splitter"></td>
					<th>Address:</th>
					<td></td>
				</tr>
				<tr>
					<th>Designation:</th>
					<td></td>
					<td class="splitter"></td>
					<th>City:</th>
					<td></td>
				</tr>
				<tr>
					<th>Department:</th>
					<td></td>
					<td class="splitter"></td>
					<th>State:</th>
					<td></td>
				</tr>
				<tr>
					<th>Company:</th>
					<td></td>
					<td class="splitter"></td>
					<th>PIN:</th>
					<td></td>
				</tr>
				<tr>
					<th>Phone:</th>
					<td></td>
					<td class="splitter"></td>
					<th>Email:</th>
					<td></td>
				</tr>
				<th colspan="5" class="headerLeaf">CUSTODIAN</th>
				</tr>
				<tr>
					<td colspan="5" rowspan="6"></td>
				</tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr>
					<th colspan="5" class="headerLeaf">TRANSPORT INFO</th>
				</tr>
				<tr>
					<th colspan="2">Transport Personel:</th>
					<td></td>
					<td colspan="2"></td>
				</tr>
				<tr>
					<th colspan="5" class="headerLeaf">APPROVER'S DETAILS</th>
				</tr>
				<tr>
					<th>Name:</th>
					<td></td>
					<th>StaffID:</th>
					<td></td>
					<th>Approval Date: <%=(new java.util.Date()).toLocaleString()%></th>
				</tr>
			</tbody>
		</table>
	</div>


	<div class="container-fluid button-leaf">
		<div class="row">
			<div class="col text-center">
				<button class="btn btn-primary" onclick="approve()" id="approve">Approve</button>
			</div>
			<div class="col-2"></div>
			<div class="col text-center">
				<button class="btn btn-primary" onclick="cancel()" id="cancel">Cancel</button>
			</div>
		</div>
	</div>

	<div class="container" id="reasonForCancellation">
		<div class="container-fluid cancel-header">Please Enter a Valid
			Reason for cancellation:</div>
		<textarea rows="6"></textarea>
		<div class="container button-leaf-2">
			<div class="row">
				<div class="col text-center">
					<button class="btn btn-primary">Submit</button>
				</div>
				<div class="col text-center">
					<button class="btn btn-primary" onclick="undo()">Clear</button>
				</div>
			</div>
		</div>
	</div>



	<!-- Importing tether,jQuery,Bootstrap javaScripts -->

	<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js"
		integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"
		integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js"
		integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn"
		crossorigin="anonymous"></script>

</body>

<script src="js/portal.js"></script>
</html>
