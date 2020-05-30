<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html lang="en">

<script>
function validate(){
var username=document.login_form.username.value;
var password=document.login_form.password.value;
if(username==""){
 alert("Enter Username!");
  return false;
}
if(password==""){
 alert("Enter Password!");
  return false;
}
return true;
}
</script>

  <head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
<style media="screen">
 .btn-outline-primary{
    background-color:white;
    border-color:#993399;
    color:#993399
  }
  .btn-outline-primary:hover{
    background-color:#993399;
    border-color:violet;
    color:white;
  }
  .loginField {
    outline: 0;
  border-width: 0 0 2px;
  border-color: #993399;
  }
</style>
  </head>
  <body>
  <script type="text/javascript" src="js\angular.js"></script>
    <div class="container-fluid" style="background-color:#993399;width:100%;height:110px;border:solid 5px violet;">
    <img src="img_src\login_logo.jpg" alt="" height="90px" align="left"  style="margin-top:5px;margin-right:20px;">
    <img src="img_src\gandhi-logo.png" alt="" align="right" height="90px" style="margin-top:5px;">
     <p class="text-white" style="margin-top:10px;">Bharat Heavy Electricals Limited
     <br>Heavy Plates and Vessels Plant
     <br>Visakhapatnam</p>
    </div>
    <div class="jumbotron text-center" style="width:100%;background-color:white;">
      <div class="container-fluid">
      <img src="img_src\landing3.jpg" align="left" width="60%" style="padding:10px;outline:solid 4px violet;">
  <form name="login_form" class="" action="<%=request.getContextPath()%>/login" method="post" onsubmit="javascript:return validate();" align="center">
    <label for="uName">Username:</label>
      <img src="img_src\useLogo.png" width="20px" height="20xp">
      <input class="loginField" type="text" name="uName" placeholder="Enter Username" style="margin:20px;padding:4px 4px;" ng-model="user.name" ng-required="true" required>
      <br>
      <label for="uPassw">Password:</label>
      <img src="img_src\computer-icons-password-login-user-padlock.jpg" alt="" width="20px" height="20xp">
      <input class="loginField" type="password" name="uPassw" placeholder="Enter Password" style="margin:20px;padding:4px 4px;" ng-model="user.pass" ng-required="true" required>
      <br>
      <input class="btn btn-outline-primary" type="button" value="Sign In" style="margin:10px;">
    </form>
  </div>
  </div>
  <div class="container-fluid align-bottom" style="background-color:#993399;width:100%;height:60px;margin-top:30px;display:inline-block;border:solid 5px violet">
  </div>
<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>
  </body>
</html>
