<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="login.database.*"%>
<%@page import="login.web.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
	Security security = new Security();
security.enable(session, response);
%>


<%
	String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://dno6xji1n8fm828n.cbetxkdyhwsb.us-east-1.rds.amazonaws.com:3306/";
String database = "zvp0njb2yauy3fgk";
String userid = "pjyaoyeilkkbtjg8";
String password = "ejzn69wchxp2bv6j";

try {
	Class.forName(driver);
} catch (ClassNotFoundException e) {
	e.printStackTrace();
}
Connection connection = null;
Statement statement = null;

try {
	connection = DriverManager.getConnection(connectionUrl + database, userid, password);
	statement = connection.createStatement();
%>

<!DOCTYPE html>
<html ng-app>
<head>
<meta charset="ISO-8859-1">
<title>Material Gate Pass</title>


<!--Importing Bootstrap css files from the cdn server,4.0.0-alpha.6 being the release Version-->


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css"
	integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ"
	crossorigin="anonymous">


<!--Importing custom css used for applying a theme to the page-->


<link rel="stylesheet" href="css/raise.css">

<!--Importing AngularJS-->


<script type="text/javascript" src="js\angular.min.js"></script>
</head>
<body>


	<!--Importing the Bootstrap Navigation Bar-->


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
				<li class="nav-item active"><a class="nav-link"
					href="gatepass_raise.jsp">RAISE GATE PASS</a></li>
				<li class="nav-item dropdown"><a
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
						<a class="dropdown-item" href="gatepass_approval_home.jsp">Approve Pending Requests</a>
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
	<div class="container-fluid">
		<div class="row">
			<%
				String user = (String) session.getAttribute("username");
			String pass = (String) session.getAttribute("password");
			String loggedInUser = "select * from login where username='" + user + "' and password='" + pass + "'";
			ResultSet rs1 = statement.executeQuery(loggedInUser);
			while (rs1.next()) {
			%>
			<div class="col text-left welcomeMessage">
				<b>Name:</b><%=rs1.getString("firstname")%> <%=rs1.getString("lastname")%>

			</div>
			<div class="col text-right">
				<b>Staff ID:</b><%=rs1.getString("staff_id")%>
				
				<%
					}
				connection.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
				%>
			</div>
		</div>
	</div>

	<h3 class="text-center">
		<b>GATE PASS FORM</b>
	</h3>

	<form class="" action="<%=request.getContextPath()%>/raisegatepass"
		method="post" id="gatepassMainForm">
		<div class="container form-group-header">PERSON TAKING THE
			MATERIAL</div>

		<!--Creating a Radio Group Block  for Selecting BHEL/NON-BHEL-->

		<div class="container" id="personRadioGroup">

			<input type="radio" id="bhelPerson" name="personType"
				value="bhelPerson" onclick="bhel()" /> <label for="bhelPerson">BHEL,
				HPVP Person</label> <br> <input type="radio" id="nonBhelPerson"
				name="personType" value="nonBhelPerson" onclick="nonBhel()" /> <label
				for="nonBhelPerson">Non BHEL, HPVP Person</label><br>

		</div>

		<!--Creating the Extra Content that will be displayed depending on BHEL/NON-BHEL-->

		<!--Extra Internal Form for a BHEL Person-->

		<div class="container" id="bhelInfo">
			<label for="bhelStaffNo">Staff No:</label> <input type="text"
				name="bhelStaffNo" value="" /> <br> <label for="bhelName">Name:</label>
			<input type="text" name="bhelName" value="" /> <br> <label
				for="bhelDeg">Designation:</label> <input type="text" name="bhelDeg"
				value="" /> <br> <label for="bhelDept">Department:</label> <input
				type="text" name="bhelDept" value="" />
		</div>

		<!--Extra Internal Form for a NON-BHEL Person-->

		<div class="container" id="nonBhelInfo">
			<label for="nonBhelName">Name:</label> <input type="text"
				name="NbhelName" value="" /> <br> <label for="nonBhelCompany">Company
				Name:</label> <input type="text" name="bhelCompany" value="" /> <br> <label
				for="nonBhelAddress">Address:</label> <input type="text"
				name="bhelAddress" value="" />
		</div>

		<div class="container form-group-header">MATERIAL DETAILS</div>
		<div class="materialForm text-center text-center">
			<label for="noOfItems">Number of Items:</label> <input type="number"
				name="noOfItems" id="noOfItems" size="2"/>
			<input type="button" value="Submit" onclick="generate()" class="btn btn-primary">
			<div id="wrapper" class="text-center"></div>
		</div>

		<div class="container text-white form-group-header">RECEIVER'S
			DETAILS</div>
		<div class="container" id="receiverForm" align="center">
			<div class="form-row">
				<label for="personName">Name :</label> <input type="text"
					name="personName" ng-required="true" /> <label for="personAdd">Address
					:</label> <input type="text" name="personAdd" />
			</div>
			<div class="form-row text-center">
				<label for="personDesg">Designation :</label> <input type="text"
					name="personDesg" /> <label for="personCity">City :</label> <input
					type="text" name="personCity" />
			</div>
			<div class="form-row text-center">
				<label for="personDept">Department :</label> <input type="text"
					name="personDept" ng-required="true" /> <label for="personState">State
					:</label> <input type="text" name="personState" />
			</div>
			<div class="form-row text-center">
				<label for="personCName">Company Name :</label> <input type="text"
					name="personCName" /> <label for="personPin">Pincode :</label> <input
					type="text" name="personPin" />
			</div>
			<div class="form-row text-center">
				<label for="personPhone">Tele/Mobile No. :</label> <input type="tel"
					name="personPhone" ng-required="true" /> <label for="personMail">Email
					:</label> <input type="email" name="personMail" ng-required="true" />
			</div>
		</div>
		<div class="container text-white form-group-header">CUSTODIAN OF
			MATERIAL</div>
		<div class="container form-group-label">
			Purpose of gatepass and Description of material <br>
			<textarea id="custodian" name="custodian" rows="6"></textarea>
		</div>

		<!--Button Group for Register,Save Draft,Cancel -->

		<div class="container-fluid button-leaf">
			<div class="row">
			
			
			
				<div class="col ">

					<!--This button will save the gatepass as a draft-->
					
					<script type="text/javascript">
						function confirmSave() {
							var answer = confirm("The form is not complete. You can fill it later and then Register again")
							if (answer) {
								
							} else {
								return false;
							}
						}
					</script>
					
					<input class="btn btn-primary" type="button" value="Save as Draft"
						onclick="return confirmSave();">
				</div>
				
				
				
				
				<div class="col text-center">

					<!--This button will Register the gatepass provided none of the feilds are invalid-->

					<input class="btn btn-primary" type="submit" value="Register">
				</div>
				
				<div class="col text-right">
				
					<!--This button clears the current form and the gatepass will be cancelled-->
					

					<input class="btn btn-primary" type="button" value="Cancel"
						onclick="confirmClear();">
				</div>
			</div>
		</div>
	</form>


	<!--Importing jQuery,tether,Bootstrap JavaScripts, as bootstrap requires jQuery and tether-->


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


<!--JavaScript for dynamic content based on type of person BHEL/NON-BHEL -->


<script type="text/javascript" src="js\main.js"></script>

</html>
