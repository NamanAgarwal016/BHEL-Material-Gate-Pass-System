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
<html>
<head>
<meta charset="ISO-8859-1">
<title>Material Gate Pass - In Draft</title>

<!-- Adding Bootstrap CSS -->

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css"
	integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ"
	crossorigin="anonymous">

<!-- Adding Custom CSS -->

<link rel="stylesheet" href="css/navbar-side.css">
<link rel="stylesheet" href="css/main.css">


<!-- Font Awesome JS -->
    
<script src="https://kit.fontawesome.com/2828a76884.js" crossorigin="anonymous"></script>
    
</head>
<body>

<!-- Creating the Navigation Menu -->

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
			System.out.println("user");
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
				%>

			</div>
		</div>
	</div>



	<!-- Creating the table for in Draft Gatepasses -->

	<div class="container">

		<%
			int staff_id = (Integer) session.getAttribute("ID");
		String draftDetails = "select * from InDraftView where staff_id='" + staff_id + "'";
		ResultSet rs2 = statement.executeQuery(draftDetails);
		%>



		<table align="center" class="table table-striped">


			<thead class="thead-dark">
				<tr>
					<th scope="col" colspan="5" id="tableTitle">YOUR LIST OF GATE
						PASSES CURRENTLY IN DRAFT</th>
				</tr>
				<tr>
					<th>GatePass No.</th>
					<th>Gate Pass For</th>
					<th>Initiating Officer</th>
					<th>Take Action</th>
				</tr>
			</thead>


			<tbody>


				<%
					while (rs2.next()) {
				%>
				<tr>
					<td><%=rs2.getString("gatepass")%></td>
					<td><%=rs2.getString("name")%></td>
					<td><%=rs2.getString("InitiatingOfficer")%></td>
					<td><a
						href="gatepass_editDraft.jsp?pass_Number=<%=rs2.getString("gatepass")%>&initiating_Officer=<%=rs2.getString("InitiatingOfficer")%>">Fill & Register</a></td>
				</tr>
				<%
					}
				%>



			</tbody>
		</table>
	</div>

	<%
		connection.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	%>


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
</html>
