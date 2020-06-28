<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@page import="login.web.Security"%>
<%
Security security = new Security();
security.enable(session, response);
%>

<!DOCTYPE html>
<html lang="en" ng-app>
  <head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="shortcut icon" type="image/png" href="./img_src/favicon.jpg" />
    <title>Gate Pass - Security Portal</title>
    
    <!-- Adding Bootstrap CSS -->
    
    <!-- Bootstrap CSS CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" 
    integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
    
   <link rel="stylesheet" href="css/navbar-side.css">
   <link rel="stylesheet" href="css/security.css"> 
    
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
                <h3>Material Gate Pass Security</h3>
                <strong>GS</strong>
            </div>

            <ul class="list-unstyled components">
                <li class="active">
                    <a href="gatepassSecurity.jsp">
                        <i class="fas fa-home" aria-hidden="true"></i>
                        Home
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
            
    <div class="container security text-center">
    <span style="font-size:100px;"><i class="fas fa-file-invoice"></i></span>
    <div class="container-main">
	<form name="login_form" id="login_form" action="<%=request.getContextPath()%>/SecurityG" method="post">
	    
		<label for="Gnumber">Gate Pass Number <i class="fas fa-key"></i></label> 
		<input class="loginField" type="text" name="Gnumber" ng-model="gate.no" ng-required="true" required size="21"><br>
			<div class="button-leaf">
			<button class="btn btn-check" type="submit"><i class="far fa-check-circle"></i></button>
			<button class="btn btn-reject" type="reset" onclick="clear()"><i class="far fa-times-circle"></i></i></button>
			</div>
	</form>
	</div>
	</div>
	
	</div>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>
  
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
        function clear(){
        	var form=document.getElementById("login_form");
        	form.reset();
        }
        </script>
</body>
</html>