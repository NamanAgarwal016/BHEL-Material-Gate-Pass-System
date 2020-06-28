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
<link rel="shortcut icon" type="image/png" href="./img_src/favicon.jpg" />
    
<title>Material Gate Pass - Home</title>

<!-- Bootstrap CSS CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" 
    integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
    
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
                        <i class="fas fa-file-upload"></i>
                        Raise
                    </a>
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
                    <a href="gatepass_contact.jsp">
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
                                <a class="nav-link" >Welcome, <%=rs1.getString("firstname")%></a>
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
   
   <!-- Creating the table for displaying status of gatepass -->
	<div class="container table-holder">
		<table align="center" class="table table-striped table-primary">
		  <%		
		int staff_id = (Integer) session.getAttribute("ID");
		String loggedInUserr = "select * from status_View where staff_id='" + staff_id + "'";
		ResultSet rs = statement.executeQuery(loggedInUserr);
	%>
    
			<thead class="thead-dark">
				<tr>
					<th scope="col" colspan="4" id="tableTitle">MATERIAL GATE PASS
						SYSTEM</th>
				</tr>
			</thead>
			<tbody>
<% 
				while (rs.next()) {
				%>
				<tr>
					<th>In Draft Mode</th>
					<td><%=rs.getString("InDraft")%></td>
					<th>Pending Approval</th>
					<td><%=rs.getString("Pending")%></td>
				</tr>
				<tr>
					<th>Approved</th>
					<td><%=rs.getString("Approved")%></td>
					<th>Permitted</th>
					<td><%=rs.getString("LeftP")%></td>
				</tr>
				<tr>
					<th>Closed</th>
					<td><%=rs.getString("Closed")%></td>
					<th>Cancelled</th>
					<td><%=rs.getString("Declined")%></td>
				</tr>

			</tbody>

<%} %>
		</table>
	</div>
   
   
   
   
   
   
    <!-- Drawing Google Chart -->
    <div class="text-center"  id="donutchart"></div>
	
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
<%
String total = "select * from total_stats;";
ResultSet rs3 = statement.executeQuery(total);
while (rs3.next()) {
%>
<script type="text/javascript" align="center">
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
                  ['Approved',<%=rs3.getString("Approved")%>],
                  ['Closed',  <%=rs3.getString("Closed")%>],
                  ['Cancelled', <%=rs3.getString("Declined")%>],
                  ['In Draft', <%=rs3.getString("In Draft")%>],
                  ['Pending',  <%=rs3.getString("Pending")%>]
                ]);

                var options = {
                  pieHole: 0.4,
                  colors: ['#99e699', "#3f51b5","#2196f3","#ff8080","#ff9933"],
                  title : "MATERIAL GATE PASS STATUS",
                  titleTextStyle: {
                      color: 'black',    // any HTML string color ('red', '#cc00cc')
                      fontName: 'Poppins', // i.e. 'Times New Roman'
                      fontSize: 16, // 12, 18 whatever you want (don't specify px)
                      bold: true,    // true or false
                      italic: false   // true of false
                  }
                };

                var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
                chart.draw(data, options);
              }
           
    </script>
    	<%}
				connection.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
				%>
    
    
</body>
</html>
