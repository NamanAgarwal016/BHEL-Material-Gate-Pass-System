<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="login.database.*"%>
<%@page import="login.web.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import = "java.io.*,java.util.Date" %>
<%@ page import = "javax.servlet.*,java.text.*" %>
<%@ page import = "java.text.ParseException"%>
<%@ page import = "java.text.SimpleDateFormat"%>
<%@ page import = "java.util.Date"%>
<%@ page import = "java.util.concurrent.TimeUnit"%>


<%
	Security security = new Security();
security.enable(session, response);
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <title>Gate Pass - Admin</title>
    
    <!-- Adding Bootstrap CSS -->
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
    
   <link rel="stylesheet" href="css/navbar-side.css">
   <link rel="stylesheet" href="css/admin.css"> 
   <!-- Font Awesome JS -->
    
<script src="https://kit.fontawesome.com/2828a76884.js" crossorigin="anonymous"></script>
    
    
    
    </head>
<body>
<body>
	<%
		try {
		String driver = "com.mysql.jdbc.Driver";
		String connectionUrl = "jdbc:mysql://dno6xji1n8fm828n.cbetxkdyhwsb.us-east-1.rds.amazonaws.com:3306/";
		String database = "zvp0njb2yauy3fgk";
		String userid = "pjyaoyeilkkbtjg8";
		String password = "ejzn69wchxp2bv6j";
		Class.forName(driver);
		Connection connection = null;
		Statement statement = null;
		connection = DriverManager.getConnection(connectionUrl + database, userid, password);
		statement = connection.createStatement();
	%>

    
     <!-- Creating the Navigation Menu -->

	<div class="wrapper">
        <!-- Sidebar  -->
        <nav id="sidebar">
            <div class="sidebar-header">
                <h3>Gate Pass Admin Portal</h3>
                <strong>GA</strong>
            </div>

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
                        <i class="fas fa-align-justify"></i>
                    </button>
                </div>
            </nav>
  <table border=1 align=center class="table table-striped table-primary">
		<thead>
			<tr>
				<th>Gate Pass Number</th>
				<th>Issuing Officer</th>
				<th>Initiating Officer</th>
				<th>Status</th>
				<th>Date Of Leaving </th>
				<th>Date Of Closing</th>
				<th>Date of Return</th>
				<th>Send Email Reminder</th>
			</tr>
		</thead>
		  <%
    String loggedInUser;
	String insertTableSQL3 = "SELECT a.* ,b.status, b.Date_of_return,b.InitiatingOfficer,c.email from admin_view a, material b, login c where a.GatePassNumber=b.PassNumber and b.staff_id=c.staff_id group by GatePassNumber;";
	PreparedStatement st3 = connection.prepareStatement(insertTableSQL3);
	ResultSet rs1 = st3.executeQuery();
	int entry = 0;
	while (rs1.next()) {
	 %>
	
		<tbody>
			<tr>
				<td><%=rs1.getString("GatePassNumber")%></td>
				<td><%=rs1.getString("Issuing Officer")%></td>
				<td><%=rs1.getString("InitiatingOfficer")%></td>
				<td><%=rs1.getString("status")%></td>
				<td><%=rs1.getString("Date_of_Leaving")%></td>
				<td><%=rs1.getString("Date_of_Returning")%></td>
				<td><%=rs1.getString("Date_of_return")%></td>
				<td><a href="<%=request.getContextPath()%>
				/SendMail?email=<%=rs1.getString("email")%>
				&date=<%=rs1.getString("Date_of_return")%>&Pass=<%=rs1.getString("GatePassNumber")%>">
				<span class="mail-button"><i class="fas fa-envelope-open-text"></i></span></a></td>
			</tr>

			<%
				}
			%>
		</tbody>
	</table>
	<%
		connection.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	%>
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
		
		<!-- Popper.JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" 
        integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" 
        crossorigin="anonymous"></script>
</body>
<script>
$(document).ready(function () {
    $('#sidebarCollapse').on('click', function () {
        $('#sidebar').toggleClass('active');
    });
});
    $("#logout").on('click', function() {
        	  window.location = "<%=request.getContextPath()%>/logout" 
        	});
</script>
</html>