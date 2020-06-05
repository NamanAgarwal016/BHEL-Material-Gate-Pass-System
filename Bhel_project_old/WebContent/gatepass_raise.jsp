<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html ng-app>
<head>
<meta charset="ISO-8859-1">
<title>Raise</title>


    <!--Importing Bootstrap css files from the cdn server,4.0.0-alpha.6 being the release Version-->
    
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
    
    
    <!--Importing custom css used for applying a theme to the page-->
    
    
    <link rel="stylesheet" href="css/raise.css">
    
    <!--Importing AngularJS-->
    
    
<script type="text/javascript" src="js\angular.min.js"></script>
</head>
<body>


<!--Importing the Bootstrap Navigation Bar-->


    <nav class="navbar navbar-toggleable navbar-inverse">
         <button class="navbar-toggler" data-toggle="collapse" data-target="#mainNav">
         <span class="navbar-toggler-icon"></span>
         </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
      <ul class="navbar-nav">
        <li class="nav-item">
        <a class="nav-link" href="gatepass_status.jsp">HOME <span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item active">
        <a class="nav-link" href="gatepass_raise.jsp">RAISE GATE PASS</a>
        </li>
        <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          VIEW
        </a>
     <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="gatepass_approved.jsp">Approved</a>
          <a class="dropdown-item" href="gatepass_closed.jsp">Closed</a>
          <a class="dropdown-item" href="gatepass_pending.jsp">Pending</a>
          <a class="dropdown-item" href="gatepass_cancelled.jsp">Cancelled</a>
          <a class="dropdown-item" href="gatepass_inDraft.jsp">In Draft</a>
    </div>
        </li>
        <li class="nav-item">
        <a class="nav-link" href="gatepass_print.jsp">
          PRINT
         </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="gatepass_help.jsp">
          HELP
        </a>
        </li>
        </ul>
  </div>
    </nav>
    
    
    <!--Creating the logout Button-->
    
    
    <button class="btn btn-danger" onclick="">Logout</button>
    
    
    <!--Creating Container Block Element for creating a Table -->
    
    
    <div class="container">
      <form class="" action="gatepassProcess.jsp" method="post" id="gatepassMainForm">
      
      
        <!--Input table for Material Information-->
        
        
      <table align="center" class="table table-bordered">
        <thead>
          <tr>
            <th colspan="5" class="text-center text-white form-group-header">RETURNABLE GATE PASS</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <th>S.No.</th>
            <th>Description of Material</th>
            <th>Unit</th>
            <th>Quantity</th>
            <th>
              Date of Return
            </th>
          </tr>
          <tr>
            <td>1</td>
            <td><input class="tableEntry" type="text" name="materialInfo"></td>
            <td>
             <select name="materialUnit" class="tableEntry">
               <option></option>
               <option>No.</option>
               <option>Kgs</option>
               <option>Mtr.</option>
               <option>Set</option>
               <option>Ltr.</option>
            </td>
            <td> <input type="number" class="tableEntry" name="materialQuantity" value=""> </td>
            <td> <input name="materialDate" type="text" class="tableEntry" onfocus="(this.type='date')" onfocusout="(this.type='text')">   </td>
          </tr>
          <tr>
            <td>2</td>
            <td><input class="tableEntry" type="text"></td>
            <td>
             <select name="materialUnit" class="tableEntry">
               <option></option>
               <option>No.</option>
               <option>Kgs</option>
               <option>Mtr.</option>
               <option>Set</option>
               <option>Ltr.</option>
            </td>
            <td> <input name="materialQuantity"  type="number" class="tableEntry" value=""> </td>
            <td> <input name="materialDate"  type="text" class="tableEntry" onfocus="(this.type='date')" onfocusout="(this.type='text')">   </td>
          </tr>
          <tr>
            <td>3</td>
            <td><input name="materialUnit"  class="tableEntry" type="text"></td>
            <td>
             <select class="tableEntry">
               <option></option>
               <option>No.</option>
               <option>Kgs</option>
               <option>Mtr.</option>
               <option>Set</option>
               <option>Ltr.</option>
            </td>
            <td> <input type="number" class="tableEntry" name="materialQuantity" value=""> </td>
            <td> <input name="materialDate"  type="text" class="tableEntry" onfocus="(this.type='date')" onfocusout="(this.type='text')">   </td>
          </tr>
          <tr>
            <td>4</td>
            <td><input name="materialUnit"  class="tableEntry" type="text"></td>
            <td>
             <select class="tableEntry">
               <option></option>
               <option>No.</option>
               <option>Kgs</option>
               <option>Mtr.</option>
               <option>Set</option>
               <option>Ltr.</option>
            </td>
            <td> <input type="number" class="tableEntry" name="materialQuantity" value=""> </td>
            <td> <input name="materialDate" type="text" class="tableEntry" onfocus="(this.type='date')" onfocusout="(this.type='text')">   </td>
          </tr>
          <tr>
            <td>5</td>
            <td><input name="materialUnit" class="tableEntry" type="text"></td>
            <td>
             <select class="tableEntry">
               <option></option>
               <option>No.</option>
               <option>Kgs</option>
               <option>Mtr.</option>
               <option>Set</option>
               <option>Ltr.</option>
            </td>
            <td> <input type="number" class="tableEntry" name="materialQuantity" value=""> </td>
            <td> <input name="materialDate" type="text" class="tableEntry" onfocus="(this.type='date')" onfocusout="(this.type='text')">   </td>
          </tr>
          <tr>
            <td>6</td>
            <td><input name="materialUnit" class="tableEntry" type="text"></td>
            <td>
             <select class="tableEntry">
               <option></option>
               <option>No.</option>
               <option>Kgs</option>
               <option>Mtr.</option>
               <option>Set</option>
               <option>Ltr.</option>
            </td>
            <td> <input type="number" class="tableEntry" name="materialQuantity" value=""> </td>
            <td> <input name="materialDate" type="text" class="tableEntry" onfocus="(this.type='date')" onfocusout="(this.type='text')">   </td>
          </tr>
        </tbody>
      </table>
    </div>
    <div class="container text-white form-group-header">
      PERSON TAKING THE MATERIAL
    </div>

    <!--Creating a Radio Group Block  for Selecting BHEL/NON-BHEL-->

    <div class="container" id="personRadioGroup">

      <input type="radio" id="bhelPerson" name="personType" value="bhelPerson" onclick="bhel()"/>
      <label for="bhelPerson">BHEL, HPVP Person</label><br>
      <input type="radio" id="nonBhelPerson" name="personType" value="nonBhelPerson" onclick="nonBhel()" />
      <label for="nonBhelPerson">Non BHEL, HPVP Person</label><br>

    </div>

    <!--Creating the Extra Content that will be displayed depending on BHEL/NON-BHEL-->

    <!--Extra Internal Form for a BHEL Person-->

    <div class="container" id="bhelInfo">
      <label for="bhelStaffNo">Satff No:</label>
      <input type="text" name="bhelStaffNo" value=""/>
      <br>
      <label for="bhelName">Name:</label>
      <input type="text" name="bhelName" value=""/>
      <br>
      <label for="bhelDeg">Designation:</label>
      <input type="text" name="bhelDeg" value=""/>
      <br>
      <label for="bhelDept">Department:</label>
      <input type="text" name="bhelDept" value=""/>
    </div>

    <!--Extra Internal Form for a NON-BHEL Person-->

    <div class="container" id="nonBhelInfo">
      <label for="nonBhelName">Name:</label>
      <input type="text" name="bhelName" value=""/>
      <br>
      <label for="nonBhelCompany">Company Name:</label>
      <input type="text" name="bhelCompany" value=""/>
      <br>
      <label for="nonBhelAddress">Address:</label>
      <input type="text" name="bhelAddress" value=""/>
    </div>

    <div class="container text-white form-group-header">
      RECEIVER'S DETAILS
    </div>
    <div class="container" id="receiverForm" align="center">
         <div class="form-row">
           <label for="rcvrName" >Name :</label>
           <input type="text" name="personName" ng-required="true"/>
           <label  for="rcvrAdd">Address :</label>
           <input type="text" name="personAdd"/>
         </div>
         <div class="form-row text-center">
           <label for="rcvrDesg">Designation :</label>
           <input type="text" name="personDesg"/>
           <label for="rcvrCity">City :</label>
           <input type="text" name="personCity"/>
         </div>
         <div class="form-row text-center">
           <label for="rcvrDept">Department :</label>
           <input type="text" name="personDept"ng-required="true"/>
           <label for="rcvrState">State :</label>
           <input type="text" name="personState"/>
         </div>
         <div class="form-row text-center">
           <label for="rcvrCompany">Company Name :</label>
           <input type="text" name="personCName"/>
           <label for="rcvrPin">Pincode :</label>
           <input type="text" name="personPin"/>
         </div>
         <div class="form-row text-center">
           <label for="rcvrPhone">Tele/Mobile No. :</label>
           <input type="tel" name="personPhone" ng-required="true"/>
           <label for="rcvrMail">Email :</label>
           <input type="email" name="personMail" ng-required="true"/>
         </div>
    </div>
    <div class="container text-white form-group-header">
      CUSTODIAN OF MATERIAL
    </div>
    <div class="container form-group-label">
        Purpose of gatepass and Description of material
        <br>
        <textarea id="custodian" name="custodian" rows="6"></textarea>
    </div>
    <!--Button Group for Register,Save Draft,Cancel -->
    <div class="container-fluid button-leaf">
      <div class="row">
        <div class="col">

        <!--This button will Register the gatepass provided none of the feilds are invalid-->

      <input class="btn btn-primary" type="submit" value="Register" onclick="regForm()">
    </div>
    <div class="col-2 text-center">

      <!--This button will save the gatepass as a draft-->

      <input class="btn btn-primary" type="button" value="Save as Draft" onclick="saveDraft()">
    </div>
    <div class="col text-right">

       <!--This button clears the current form and the gatepass will be cancelled-->

      <input class="btn btn-primary" type="reset" value="Cancel" onclick="clearForm()">
    </div>
    </div>
    </div>
  </form>
  
  
  <!--Importing jQuery,tether,Bootstrap JavaScripts, as bootstrap requires jQuery and tether-->
  
  
    <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>
  </body>
  
  
  <!--JavaScript for dynamic content based on type of person BHEL/NON-BHEL -->
  
  
  <script type="text/javascript" src="js\raise.js"></script>

</html>
