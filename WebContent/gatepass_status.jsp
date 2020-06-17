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

<%@page import="login.web.Security"%>
<%
Security security = new Security();
security.enable(session, response);
%>


<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    
<title>Material Gate Pass - Home</title>

<!-- Bootstrap CSS CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
    <!-- Our Custom CSS -->
    <link rel="stylesheet" href="css/navbar-side.css">
    <link rel="stylesheet" href="css/status.css">

    <!-- Font Awesome JS -->
    
    <script src="https://kit.fontawesome.com/2828a76884.js" crossorigin="anonymous"></script>
    
    <!-- Google Charts -->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript" src="js/chart.js"></script>
    
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
                <a href="#" id="logout">
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

    <!-- Drawing Google Chart -->
    
    <div id="donutchart"></div>
 
	<!-- Displaying the Welcome Message -->

	<div class="container welcome-message">

		<%
			String user = (String) session.getAttribute("username");
		String pass = (String) session.getAttribute("password");
		String loggedInUser = "select * from login where username='" + user + "' and password='" + pass + "'";
		ResultSet rs1 = statement.executeQuery(loggedInUser);
		while (rs1.next()) {
		%>

		<h3 class="text-center">
			<b>Welcome, <%=rs1.getString("firstname")%> <%=rs1.getString("lastname")%>
				!
			</b>
		</h3>

		<%
			}
		%>

	</div>

	<!-- Creating the table for displaying status of gatepass -->

	<div class="container table-holder">
		<table align="center" class="table table-striped">
			<thead class="thead-dark">
				<tr>
					<th scope="col" colspan="4" id="tableTitle">MATERIAL GATE PASS
						SYSTEM</th>
				</tr>
			</thead>
			<tbody>

				<%
					String status = "select * from gatepass_status";
				ResultSet rs2 = statement.executeQuery(status);
				while (rs2.next()) {
				%>
				<tr>
					<th>In Draft Mode</th>
					<td><%=rs2.getString("In Draft Mode")%></td>
					<th>Pending Approval</th>
					<td><%=rs2.getString("Pending Approval")%></td>
				</tr>
				<tr>
					<th>Approved</th>
					<td><%=rs2.getString("Approved")%></td>
					<th>Permitted</th>
					<td><%=rs2.getString("Permitted")%></td>
				</tr>
				<tr>
					<th>Closed</th>
					<td><%=rs2.getString("Closed")%></td>
					<th>Cancelled</th>
					<td><%=rs2.getString("Cancelled")%></td>
				</tr>

				<%
					}
				connection.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
				%>

			</tbody>


		</table>
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
        google.charts.load("current", {packages:["corechart"]});
        google.charts.setOnLoadCallback(drawChart);
              function drawChart() {
                var data = google.visualization.arrayToDataTable([
                  ['Status','Count'],
                  ['Approved',     11],
                  ['Closed',      2],
                  ['Cancelled',  2],
                  ['In Draft', 2],
                  ['Pending',    7]
                ]);

                var options = {
                  pieHole: 0.4,
                  colors: ['#ff9933', "#3f51b5","#2196f3","#03a9f4","#00bcd4"],
                };

                var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
                chart.draw(data, options);
              }
           
    </script>
    
    
</body>
</html>
