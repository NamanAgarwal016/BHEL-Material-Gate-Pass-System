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
	String PassNumber = (String) request.getParameter("pass_Number");
String InitiatingOfficer = (String) request.getParameter("initiating_Officer");
System.out.println(PassNumber);
System.out.println(InitiatingOfficer);

String driver = Database.getdriver();
String connectionUrl = Database.getConnectionUrl();
String database = Database.getDatabase();
String userid = Database.getUserId();
String password = Database.getPassword();

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
<meta http-equiv="Content-Type" content="text/html; charset="ISO-8859-1">
<title>Material Gate Pass</title>


<!--Importing Bootstrap css files from the cdn server,4.0.0-alpha.6 being the release Version-->


<!-- Bootstrap CSS CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" 
    integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">


<!--Importing custom css used for applying a theme to the page-->

<link rel="stylesheet" href="css/navbar-side.css">
<link rel="stylesheet" href="css/raise.css">

<!-- Font Awesome JS -->
    
<script src="https://kit.fontawesome.com/2828a76884.js" crossorigin="anonymous"></script>
    
<!--Importing AngularJS-->

<script type="text/javascript" src="js\angular.min.js"></script>
</head>
<body>

	<!-- Creating the Navigation Menu -->

	<div class="wrapper">
        <!-- Sidebar  -->
        <nav id="sidebar">
            <div class="sidebar-header">
                <h3>Material Gate Pass System</h3>
                <strong>GS</strong>
            </div>

            <ul class="list-unstyled components">
                <li>
                    <a href="gatepass_status.jsp">
                        <i class="fas fa-home" aria-hidden="true"></i>
                        Home
                    </a>
                </li>
                <li class="active">
                    <a href="gatepass_raise.jsp">
                        <i class="fas fa-file-upload"></i>
                        Raise
                    </a>
                    </li>
                        <li>
                  </li>
                  <li>
                    <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                        <i class="far fa-eye"></i>
                        View
                    </a>
                    <ul class="collapse list-unstyled" id="pageSubmenu">
                        <li>
                            <a href="gatepass_approved.jsp">Approved</a>
                        </li>
                        <li>
                            <a href="gatepass_pending.jsp">Pending</a>
                        </li>
                        <li>
                            <a href="gatepass_inDraft.jsp">In Draft</a>
                        </li>
                        <li>
                            <a href="gatepass_closed.jsp">Closed</a>
                        </li>
                        <li>
                            <a href="gatepass_cancelled.jsp">Cancelled</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="gatepass_approval_home.jsp">
                    <i class="fas fa-check"></i>
                            Approve
                    </a>
                </li>
                <li>
                    <a href="gatepass_print.jsp">
                        <i class="fas fa-print"></i>
                        Print
                    </a>
                </li>
                <li>
                    <a href="gatepass_help.jsp">
                        <i class="fas fa-question"></i>
                        Help
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="fas fa-paper-plane"></i>
                   Contact
              </a>
                </li>
            </ul>

           <ul class="list-unstyled components">
            <li>
                <a href="#" id="logout">
                <i class="fas fa-sign-out-alt"></i>
                Logout
                </a>
            </li>
            </ul>
        </nav>
        
               
        <%
			String user = (String) session.getAttribute("username");
		String pass = (String) session.getAttribute("password");
		String loggedInUser = "select * from login where username='" + user + "' and password='" + pass + "'";
		ResultSet rs1 = statement.executeQuery(loggedInUser);
		while (rs1.next()) {
		%>
        
        <!-- Page Content  -->
        <div id="content">

            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">

                    <button type="button" id="sidebarCollapse" class="btn btn-info">
                        <i class="fas fa-align-justify"></i>
                        <span></span>
                    </button>
                    <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <i class="fas fa-align-justify"></i>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="nav navbar-nav ml-auto">
                            <li class="nav-item active">
                                <a class="nav-link" ><%=rs1.getString("firstname")%></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link"><span style="color:black;font-size:20px"><i class="fas fa-user-tie"></i></span></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>

        <%
			}
%>
	<h3 class="text-center">
		<b>GATE PASS FORM</b>
	</h3>


	<h3 class="text-center">
		<b><%=PassNumber%></b>
	</h3>


	<form class="" action="<%=request.getContextPath()%>/DraftServlet"
		method="post" id="gatepassMainForm">


		<div class="container form-group-header">PERSON TAKING THE
			MATERIAL</div>

		<!--Creating a Radio Group Block  for Selecting BHEL/NON-BHEL-->

		<div class="container" id="personRadioGroup">

			<input type="radio" id="bhelPerson" name="personType"
				value="bhelPerson" onclick="bhel()" /> <label for="bhelPerson">BHEL,
				HPVP</label> <br> <input type="radio" id="nonBhelPerson"
				name="personType" value="nonBhelPerson" onclick="nonBhel()" /> <label
				for="nonBhelPerson">Non BHEL, HPVP</label><br>

		</div>

		<!--Creating the Extra Content that will be displayed depending on BHEL/NON-BHEL-->

		<!--Extra Internal Form for a BHEL Person-->
		<%
				String Info = "SELECT * FROM bhel_person WHERE gatepass='" + PassNumber + "'";
			ResultSet rs10 = statement.executeQuery(Info);
				rs10.next();
			%>

		<div class="container" id="bhelInfo">
			<label for="bhelStaffNo">Staff No:</label> <input type="text"
				name="bhelStaffNo" value="<%=rs10.getString("staff_id")%>" /> <br> <label
				for="bhelName">Name:</label><input type="text" name="bhelName"
				value="<%=rs10.getString("name")%>" /> <br> <label for="bhelDeg">Designation:</label>
			<input type="text" name="bhelDeg" value="<%=rs10.getString("designation")%>" /> <br> <label
				for="bhelDept">Department:</label> <input type="text"
				name="bhelDept" value="<%=rs10.getString("department")%>" />
		</div>

		<!--Extra Internal Form for a NON-BHEL Person-->

		<div class="container" id="nonBhelInfo">
			<label for="nonBhelName">Name:</label> <input type="text"
				name="NbhelName" value="name" /> <br> <label
				for="nonBhelCompany">Company Name:</label> <input type="text"
				name="bhelCompany" value="company name" /> <br> <label
				for="nonBhelAddress">Address:</label> <input type="text"
				name="bhelAddress" value="address" />
		</div>

		<div class="container form-group-header">MATERIAL DETAILS</div>
		<div class="materialForm text-center">

			<%
				String numberOfItems = "SELECT COUNT(PassNumber) FROM material WHERE PassNumber='" + PassNumber + "'";
			ResultSet rs4 = statement.executeQuery(numberOfItems);
			while (rs4.next()) {
				String n = rs4.getString("COUNT(PassNumber)");
			%>

			<label for="noOfItems">Number of Items:</label> <input type="number"
				name="noOfItems" id="noOfItems"
				value=<%=rs4.getString("COUNT(PassNumber)")%>>

			<%
				}
			%>


			<input type="button" value="Generate New Form" onclick="generate()">
			<div id="wrapper" class="text-center">

				<table border="1" class="text-center table table-bordered">
					<thead>
						<tr>
							<th>S. No.</th>
							<th>Description</th>
							<th>Unit</th>
							<th>Quantity</th>
							<th>Date of Return</th>
						</tr>
					</thead>
					<tbody>
						<%
							String materialTable = "select * from material WHERE PassNumber='" + PassNumber + "'";
						ResultSet rs5 = statement.executeQuery(materialTable);
						for (int i = 1; rs5.next(); i++) {
						%>
						<tr>
							<td><%=i%></td>
							<td><input class="tableEntry" type="text"
								name="materialInfo" value=<%=rs5.getString("Materials")%>></td>
							<td><select class="tableEntry" name="materialUnit"><option></option>
									<option>No.</option>
									<option>Kgs</option>
									<option>Mtr.</option>
									<option>Set</option>
									<option>Ltr.</option></td>
							<td><input class="tableEntry" type="number"
								name="materialQuantity" value=<%=rs5.getString("Quantity")%>></td>
							<td><input class="tableEntry" type="date"
								name="materialDate" value=<%=rs5.getString("Date_of_return")%>></td>
						</tr>

						<%
							}
						%>
					</tbody>
				</table>
			</div>

		</div>

		<div class="container text-white form-group-header">RECEIVER'S
			DETAILS</div>



		<div class="container" id="receiverForm" align="center">

			<%
				String receiverTable = "select * from receiver WHERE gatepass='" + PassNumber + "'";
			ResultSet rs2 = statement.executeQuery(receiverTable);
			while (rs2.next()) {
			%>
			<div class="form-row">
				<label for="personName">Name :</label> <input type="text"
					name="personName" value=<%=rs2.getString("name")%>> <label
					for="personAdd">Address :</label> <input type="text"
					name="personAdd" value=<%=rs2.getString("address")%>>
			</div>
			<div class="form-row text-center">
				<label for="personDesg">Designation :</label> <input type="text"
					name="personDesg" value=<%=rs2.getString("designation")%>>
				<label for="personCity">City :</label> <input type="text"
					name="personCity" value=<%=rs2.getString("city")%>>
			</div>
			<div class="form-row text-center">
				<label for="personDept">Department :</label> <input type="text"
					name="personDept" value=<%=rs2.getString("dept")%>> <label
					for="personState">State :</label> <input type="text"
					name="personState" value=<%=rs2.getString("state")%>>
			</div>
			<div class="form-row text-center">
				<label for="personCName">Company Name :</label> <input type="text"
					name="personCName" value=<%=rs2.getString("company")%>> <label
					for="personPin">PinCode :</label> <input type="text"
					name="personPin" value=<%=rs2.getString("pincode")%>>
			</div>
			<div class="form-row text-center">
				<label for="personPhone">Tele/Mobile No. :</label> <input
					type="text" name="personPhone" value=<%=rs2.getString("contact")%>>
				<label for="personMail">Email :</label> <input type="text"
					name="personMail" value=<%=rs2.getString("email")%>>
			</div>

			<%
				}
			%>

		</div>
		<div class="container text-white form-group-header">CUSTODIAN OF
			MATERIAL</div>
		<div class="container form-group-label">
			Purpose of Gate Pass and Description of material <br>

			<%
				String materialDetailsTable = "select * from material_details WHERE gatepass='" + PassNumber + "'";
			ResultSet rs3 = statement.executeQuery(materialDetailsTable);
			while (rs3.next()) {
			%>
			<textarea id="custodian" name="custodian" rows="6"><%=rs3.getString("Details")%></textarea>
			<%
				}
			%>

		</div>


		<input type="hidden" name="formStatus" id="formStatus"
			value="Approved" /> <input type="hidden" name="pass_Number"
			id="pass_Number" value=<%=PassNumber%> /> <input type="hidden"
			name="initiating_Officer" id="initiating_Officer" value=<%=InitiatingOfficer%> />


		<!--Button Group for Register,Save Draft,Cancel -->

		<div class="container-fluid button-leaf">
			<div class="row">

				<div class="col">

					<!--This button will Register the gatepass provided none of the feilds are invalid-->

					<script type="text/javascript">
						function confirmSubmit() {
							var answer = confirm("Must check if all the details are filled. Confirm Submit ??")

							if (answer) {

								var x = document
										.getElementById("gatepassMainForm");

								var i;
								for (i = 0; i < x.length; i++) {

									if (!x.elements[i].value.localeCompare("")) {

										alert("One or more fields are empty. Please fill all the details !!");
										return false;

									}
								}

								document.getElementById("formStatus").value = "pending";
								document.getElementById("gatepassMainForm").action = "<%=request.getContextPath()%>/DraftServlet";
								document.getElementById("gatepassMainForm").method = "post";
								document.getElementById("gatepassMainForm")
										.submit();

							} else {
								return false;

							}
						}
					</script>

					<input class="btn btn-primary" type="button" value="Register"
						onclick="return confirmSubmit();">
				</div>


				<div class="col text-right">

					<!--This button clears the current form and the gatepass will be cancelled-->

					<script type="text/javascript">
						function confirmClear() {
							var answer = confirm("Confirm to clear whole form ??")
							if (answer) {
								var form = document
										.getElementById("gatepassMainForm");
								form.reset();
								var hide_1 = document
										.getElementById("bhelInfo");
								var hide_2 = document
										.getElementById("nonBhelInfo");
								hide_1.style.display = "none";
								hide_2.style.display = "none";
							} else {
								return false;
							}
						}
					</script>

					<input class="btn btn-primary" type="button" value="Cancel"
						onclick="return confirmClear();">
				</div>
			</div>
		</div>

	</form>

	<%
		connection.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	%>
	
	</div>
	</div>


	<!-- Importing tether,jQuery,Bootstrap javaScript -->

	<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js"
		integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n"
		crossorigin="anonymous"></script>
		
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"
		integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb"
		crossorigin="anonymous"></script>
		
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" 
	    integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn"
	    crossorigin="anonymous"></script>

    <!-- Popper.JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" 
        integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" 
        crossorigin="anonymous"></script>

<!-- jQuery for collapsing Sidebar -->

<script type="text/javascript">
        $(document).ready(function () {
            $('#sidebarCollapse').on('click', function () {
                $('#sidebar').toggleClass('active');
            });
        });
        $("#logout").on('click', function() {
      	  window.location = "<%=request.getContextPath()%>/logout" 
      	});
    </script>
    
</body>


<!--JavaScript for dynamic content based on type of person BHEL/NON-BHEL -->

<script type="text/javascript" src="js\main.js"></script>

</html>
