<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
<style media="screen">
  .btn-primary{
    background-color:#993399;
    border-color:#993399;
  }
  .btn-primary:hover{
    background-color:violet;
    border-color:violet;
  }
  label {
    width:180px;
  }
</style>
<script type="text/javascript" src="js\angular.js"></script>
</head>
  <body>
    <nav class="navbar navbar-toggleable navbar-inverse" style="background-color:#993399;">
        <button class="navbar-toggler" data-toggle="collapse" data-target="#mainNav">
         <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="gatepass_status.html">HOME <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="#">RAISE GATE PASS</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          VIEW
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="gatepass_approved.html">Approved</a>
          <a class="dropdown-item" href="gatepass_closed.html">Closed</a>
          <a class="dropdown-item" href="gatepass_pending.html">Pending</a>
          <a class="dropdown-item" href="#">Cancelled</a>
          <a class="dropdown-item" href="#">In Draft</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="gatepass_print.html">PRINT</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="gatepass_help.html">HELP</a>
      </li>
    </ul>
  </div>
    </nav>
    <button class="btn btn-danger" style="float:right;margin:6px 6px 0 0;border-shadow:1px 1px 4px black;">Logout</button>
    <div class="container" style="margin-top:5%;">
      <table align="center" class="table table-striped">
        <thead>
          <tr>
            <td colspan="5" class="text-center text-white" style="background-color:#993399;">RETURNABLE GATE PASS</td>
          </tr>
        </thead>
        <tbody>
          <tr>
            <th>S.No.</th>
            <th>Description of Material</th>
            <th>Unit</th>
            <th>Quantity</th>
            <th>Date of Return</th>
          </tr>
          <tr>
            <td>1</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr>
            <td>2</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr>
            <td>3</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr>
            <td>4</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr>
            <td>5</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr>
            <td>6</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
        </tbody>
      </table>
    </div>
    <form class="" action="" method="post">
    <div class="container text-white" style="background-color:#993399;margin-top:3%;">
      PERSON TAKING THE MATERIAL
    </div>
    <div class="container" style="margin-top:10px;">
      <input type="radio" name="personType" value="bhelPerson" ng-clic>
      <label for="bhelPerson">BHEL, HPVP Person</label><br>
      <input type="radio" name="personType" value="non-bhelPerson">
      <label for="non-bhelPerson">Non BHEL, HPVP Person</label><br>
    </div>
    <div class="container text-white" style="background-color:#993399;margin-top:4%;">
      RECEIVER'S DETAILS
    </div>
    <div class="container" align="center" style="margin-top:2%;">
         <div class="form-row">
           <label for="personName" >Name :</label>
           <input type="text" name="personName">
           <label  for="personAdd">Address :</label>
           <input type="text" name="personAdd">
         </div>
         <div class="form-row text-center">
           <label for="personDesg">Designation :</label>
           <input type="text" name="personDesg">
           <label for="personCity">City :</label>
           <input type="text" name="personCity">
         </div>
         <div class="form-row text-center">
           <label for="personDept">Department :</label>
           <input type="text" name="personDept">
           <label for="personState">State :</label>
           <input type="text" name="personState">
         </div>
         <div class="form-row text-center">
           <label for="personCName">Company Name :</label>
           <input type="text" name="personCName">
           <label for="personPin">Pincode :</label>
           <input type="text" name="personPin">
         </div>
         <div class="form-row text-center">
           <label for="personPhone">Tele/Mobile No. :</label>
           <input type="text" name="personPhone">
           <label for="personMail">Email :</label>
           <input type="text" name="personMail">
         </div>
    </div>
    <div class="container text-white" style="background-color:#993399;margin-top:6%;margin-bottom:4%;">
      CUSTODIAN OF MATERIAL
    </div>
    <div class="container">
        Purpose of gatepass and Description of material
        <br>
        <textarea  rows="6" style="width:100%"></textarea>
    </div>
    <div class="container-fluid" style="margin-top:8%;margin-bottom:8%;">
      <div class="row">
        <div class="col">
      <input class="btn btn-primary" type="button" value="Register">
    </div>
    <div class="col-2 text-center">
      <input class="btn btn-primary" type="submit" value="Save as Draft">
    </div>
    <div class="col text-right">
      <input class="btn btn-primary" type="reset" value="Cancel">
    </div>
    </div>
    </div>
  </form>
<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>
  </body>
</html>
