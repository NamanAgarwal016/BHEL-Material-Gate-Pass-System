<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", 0); // Proxies.
%>

<!DOCTYPE html>
<html lang="en" ng-app>
<head>
<link rel="shortcut icon" type="image/png" href="./img_src/favicon.jpg" />
<meta charset="ISO-8859-1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Welcome to Material Gate Pass-BHEL, Vishakhapatnam</title>

<!-- Importing the Bootstrap CSS File -->

<!-- Bootstrap CSS CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" 
    integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<!-- Importing the Custom External CSS -->

<link rel="stylesheet" href="css/login.css">

<!-- Font Awesome JS -->
    
    <script src="https://kit.fontawesome.com/2828a76884.js" crossorigin="anonymous"></script>


<!-- Importing the angularJS javaScript file for directives -->

<script type="text/javascript" src="js\angular.js"></script>
  
</head>
<body>

	<!-- Top Block Element -->

	<div class="container-fluid header-leaf">
		<img src="img_src\login_logo.jpg" alt="" align="left" height="90"
			class="logo-top"> <img src="img_src\gandhi-logo.png" alt=""
			align="right" height="90" class="logo-top">


		<p class="text-white" align="center" style="font-size:120%;">
			Bharat Heavy Electricals Limited <br>Heavy Plates and Vessels
			Plant <br>Visakhapatnam
		</p>
	</div>


	<div class="jumbotron text-center login-main">
		<div class="container-fluid">
			<div align="left" id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel">
 				 <div class="carousel-inner">
    				<div class="carousel-item active">
     					 <img class="d-block w-100" src="img_src\landing3.jpg">
   				    </div>
   				    <div class="carousel-item">
      					 <img class="d-block w-100" src="img_src\abc.png">
                    </div>
                    <div class="carousel-item">
                         <img class="d-block w-100" src="img_src\bhel.png">
                    </div>
                    <div class="carousel-item">
                         <img class="d-block w-100" src="img_src\bhel2.png">
                    </div>
                    <div class="carousel-item">
                         <img class="d-block w-100" src="img_src\bhel3.png">
                    </div>
                    
   
                </div>
            </div>

			<!-- Login Form -->

			<form name="login_form" action="<%=request.getContextPath()%>/login" method="post" align="center">
				 
				    <label for="uName"><i class="far fa-user"></i></label> 
				    
				    <input
					class="loginField" type="text" name="username"
					placeholder="Enter Username" ng-model="user.name"
					ng-required="true" required> <br> 
					
					<label for="uPassw"><i class="fas fa-key"></i></label>
					
					<input class="loginField"
					type="password" name="password" placeholder="Enter Password"
					ng-model="user.pass" ng-required="true" required> <br>

				<button class="btn btn-primary" type="submit">Sign In <i class="fas fa-sign-in-alt"></i></button>
			</form>
		</div>
	</div>
	<div class="container-fluid align-bottom floor-leaf"></div>

	<!-- Importing script for tether,jQuery,Bootstrap -->

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
</html>