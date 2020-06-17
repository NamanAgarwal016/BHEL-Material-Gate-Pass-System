<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="login.database.*"%>
<%@page import="login.web.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.IOException"%>

<%
	Security security = new Security();
security.enable(session, response);

Integer staffid = (Integer) session.getAttribute("staffid");

if (staffid == 104|| staffid == 102 || staffid == 100 ) {
	try {
		response.sendRedirect("gatepass_invalidUser.jsp");
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}

}
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
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    
<title>Material Gate Pass</title>


<!--Importing Bootstrap css files from the cdn server,4.0.0-alpha.6 being the release Version-->


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css"
	integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ"
	crossorigin="anonymous">


<!--Importing custom css used for applying a theme to the page-->

<link rel="stylesheet" href="css/navbar-side.css">
<link rel="stylesheet" href="css/raise.css">

<!-- Font Awesome JS -->
    
<script src="https://kit.fontawesome.com/2828a76884.js" crossorigin="anonymous"></script>
    
<!--Importing AngularJS-->

<script type="text/javascript" src="js\angular.min.js"></script>
</head>
<body>

	<<!-- Creating the Navigation Menu -->

	<div class="wrapper">
        <!-- Sidebar  -->
        <nav id="sidebar">
            <div class="sidebar-header">
                <h3>Material Gate Pass</h3>
                <strong>GP</strong>
            </div>

            <ul class="list-unstyled components">
                <li class="active">
                    <a href="gatepass_status.jsp">
                        <i class="fas fa-home" aria-hidden="true"></i>
                        Home
                    </a>
                </li>
                <li>
                    <a href="gatepass_raise.jsp">
                        <i class="fas fa-ticket-alt"></i>
                        Raise
                    </a>
                    <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                        <i class="fas fa-copy"></i>
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
                    <a href="gatepass_print.jsp">
                        <i class="fas fa-file-pdf"></i>
                        Print
                    </a>
                </li>
                <li>
                    <a href="gatepass_help.jsp">
                        <i class="fas fa-question"></i>
                        FAQ
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
                <a onclick="<%=request.getContextPath()%>/logout">
                <i class="fas fa-sign-out-alt"></i>
                Logout
                </a>
            </li>
            </ul>
        </nav>

        <!-- Page Content  -->
        <div id="content">

            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">

                    <button type="button" id="sidebarCollapse" class="btn btn-info">
                        <i class="fas fa-align-justify"></i>
                        <span></span>
                    </button>
                    <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <i class="fas fa-align-left"></i>
                    </button>
                </div>
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
				<b><%=rs1.getString("firstname")%> <%=rs1.getString("lastname")%></b>

			</div>
			<div class="col text-right">
				<b>Staff ID:<%=rs1.getString("staff_id")%>
				</b>
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
				name="bhelStaffNo" value="staff no." /> <br> <label
				for="bhelName">Name:</label><input type="text" name="bhelName"
				value="name" /> <br> <label for="bhelDeg">Designation:</label>
			<input type="text" name="bhelDeg" value="desg" /> <br> <label
				for="bhelDept">Department:</label> <input type="text"
				name="bhelDept" value="dept" />
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
			<label for="noOfItems">Number of Items:</label> <input type="number"
				name="noOfItems" id="noOfItems" value="0" /> <input type="button"
				value="Generate Form" onclick="generate()">
			<div id="wrapper" class="text-center"></div>
		</div>

		<div class="container text-white form-group-header">RECEIVER'S
			DETAILS</div>
		<div class="container" id="receiverForm" align="center">
			<div class="form-row">
				<label for="personName">Name :</label> <input type="text"
					name="personName" /> <label for="personAdd">Address :</label> <input
					type="text" name="personAdd" />
			</div>
			<div class="form-row text-center">
				<label for="personDesg">Designation :</label> <input type="text"
					name="personDesg" /> <label for="personCity">City :</label> <input
					type="text" name="personCity" />
			</div>
			<div class="form-row text-center">
				<label for="personDept">Department :</label> <input type="text"
					name="personDept" /> <label for="personState">State :</label> <input
					type="text" name="personState" />
			</div>
			<div class="form-row text-center">
				<label for="personCName">Company Name :</label> <input type="text"
					name="personCName" /> <label for="personPin">PinCode :</label> <input
					type="text" name="personPin" />
			</div>
			<div class="form-row text-center">
				<label for="personPhone">Tele/Mobile No. :</label> <input
					type="text" name="personPhone" /> <label for="personMail">Email
					:</label> <input type="text" name="personMail" />
			</div>
		</div>
		<div class="container text-white form-group-header">CUSTODIAN OF
			MATERIAL</div>
		<div class="container form-group-label">
			Purpose of Gate Pass and Description of Material <br>
			<textarea id="custodian" name="custodian" rows="6"></textarea>
		</div>
		<input type="hidden" name="formStatus" id="formStatus"
			value="Approved" />
	<!--Button Group for Register,Save Draft,Cancel -->

		<div class="container-fluid button-leaf">
			<div class="row">
				<div class="col">

					<!--This button will save the gate pass as a draft-->

						<input class="btn btn-primary" type="button" value="Save as Draft" id="draft-button"
							onclick="return confirmSave();">
				
				</div>

				<div class="col text-center">

					<!--This button will Register the gate pass provided none of the fields are invalid-->

					<input class="btn btn-primary" type="submit" value="Register"
						onclick="return confirmSubmit();">
				</div>


				<div class="col text-right">

					<!--This button clears the current form and the gate pass will be cancelled-->

					<input class="btn btn-primary" type="button" value="Clear"
						onclick="return confirmClear();">
				</div>
			</div>
		</div>

	</form>


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
    </script>
    

</body>


<!--JavaScript for dynamic content based on type of person BHEL/NON-BHEL -->

<script type="text/javascript" src="js\main.js" defer></script>

</html>
