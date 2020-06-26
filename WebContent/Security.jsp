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

<%@page import="login.web.Security"%>
<%
Security security = new Security();
security.enable(session, response);
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <title>Security Entry</title>
    
    <!-- Adding Bootstrap CSS -->
    
    <!-- Bootstrap CSS CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" 
    integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
    
    <!-- Our Custom CSS -->
    <link rel="stylesheet" href="css/navbar-side.css">
    <link rel="stylesheet" href="css/security.css"> 
    
    <!-- Font Awesome JS -->
    
    <script src="https://kit.fontawesome.com/2828a76884.js" crossorigin="anonymous"></script>
    
    </head>
<body>
<body>
	<%
		try {
			String driver = Database.getdriver();
			String connectionUrl = Database.getConnectionUrl();
			String database = Database.getDatabase();
			String userid = Database.getUserId();
			String password = Database.getPassword();
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
                <h3>Material Gate Pass Security</h3>
                <strong>GS</strong>
            </div>

            <ul class="list-unstyled components">
                <li class="active">
                    <a href="gatepassSecurity.jsp">
                        <i class="fas fa-home" aria-hidden="true"></i>
                        Home <i class="fas fa-caret-right"></i>Portal
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
                        <i class="fas fa-align-justify"></i>
                    </button>
                </div>
            </nav>

    <%String userlabel = (String) request.getAttribute("GateNumber");
    String loggedInUser;
	String insertTableSQL3 = "SELECT * from bhel_person where gatepass=?";
	PreparedStatement st3 = connection.prepareStatement(insertTableSQL3);
	st3.setString(1, userlabel);
	ResultSet rs = st3.executeQuery();
	
	if (rs.next() == true) {
		 loggedInUser = "select a.* , b.name from SecurityView a, bhel_person b where a.Passnumber=b.gatepass and PassNumber='" + userlabel + "'";
	} else {
		 loggedInUser = "select a.* , b.name from SecurityView a, nonbhel_person b where a.Passnumber=b.gatepass and PassNumber='" + userlabel + "'";
		} 
		ResultSet rs1 = statement.executeQuery(loggedInUser);%>
	<table border=1 align=center class="table table-striped">
		<thead>
			<tr>
				<th>Gate Pass Number</th>
				<th>Staff ID</th>
				<th>Initiating Officer</th>
				<th>Person Taking the Material </th>
				<th>Material</th>
				<th>Quantity</th>
				<th>Unit</th>
				<th>Return Date</th>
				<th>Status</th>
			</tr>
		</thead>
		<tbody>
			<%
				while (rs1.next()) {
			%>
			<tr>
				<td><%=rs1.getString("PassNumber")%></td>
				<td><%=rs1.getString("staff_id")%></td>
				<td><%=rs1.getString("InitiatingOfficer")%></td>
				<td><%=rs1.getString("name")%></td>
				<td><%=rs1.getString("Materials")%></td>
				<td><%=rs1.getString("Quantity")%></td>
				<td><%=rs1.getString("Unit")%></td>
				<td><%=rs1.getString("Date_of_return")%></td>
				<td><%=rs1.getString("status")%></td>
			</tr>

			<%
				}
			%>
		</tbody>
	</table>

     <div class="container-fluid ">
	<div class="row fixed-bottom">
	<div class="col"></div>
	<div class="col text-center">
	<form name="login_form" action="<%=request.getContextPath()%>/Leaving"
		method="post">

		<input type="hidden" id="GatePass" name="GatePass" value=<%=userlabel%>>
		<%Date dNow = new Date( );
        SimpleDateFormat ft = 
        new SimpleDateFormat ("dd.MM.yyyy"); %>
		<input type="hidden" id="Date" name="Date" value=<%=ft.format(dNow)%>>
	    <button class="btn btn-primary" type="submit"><strong>Leaving </strong><i class="fas fa-level-up-alt"></i></button>
	</form>
	</div>
	<div class="col"></div>
	<div class="col"></div>
	<div class="col text-center">
	<form name="login_form"
		action="<%=request.getContextPath()%>/Returning" method="post">
		<input type="hidden" id="GatePass" name="GatePass"
			value=<%=userlabel%>>
			<%Date dNow1 = new Date( );
        SimpleDateFormat ft1 = 
        new SimpleDateFormat ("dd.MM.yyyy"); %>
		<input type="hidden" id="Date" name="Date" value=<%=ft1.format(dNow1)%>>
		 <button class="btn btn-primary" type="submit"><strong>Returning </strong><i class="fas fa-level-down-alt"></i></button>
	</form>
	</div>
	</div>
	</div>

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
</html>