/* This JavaScript file contains all the required functions
 * This contains functions from multiple pages
 */


// ***functions for the page gatepass_raise.jsp***



// function for dynamic extra fields based on person-type(BHEL/NON-BHEL):


function bhel() {
	var content = document.getElementById("bhelInfo");
	content.style.display = "block";
	var hide = document.getElementById("nonBhelInfo");
	hide.style.display = "none";
}
function nonBhel() {
	var content = document.getElementById("nonBhelInfo");
	content.style.display = "block";
	var hide = document.getElementById("bhelInfo");
	hide.style.display = "none";
	var hideDraft = document.getElementById("draftBtn");
	hideDraft.style.display = "none";
}


// function to generate the Material Form for the Gate Pass


function generate() {
	var num_rows = document.getElementById('noOfItems').value;
	var theader = '<table border="1" class="text-center table table-bordered">\n';
	var thead = '<thead><tr><th>S. No.</th><th>Description</th><th>Unit</th><th>Quantity</th><th>Date of Return</th></tr></thead>'
	var tbody = '';

	for (var i = 1; i <= num_rows; i++) {
		tbody += '<tr>';
		tbody += '<td>' + i + '.' + '</td>';
		tbody += '<td><input class="tableEntry" type="text" name="materialInfo">'
				+ '</td>';
		tbody += '<td><select class="tableEntry" name="materialUnit">'
				+ '<option></option><option>No.</option><option>Kgs</option><option>Mtr.</option><option>Set</option><option>Ltr.</option> '
				+ '</td>';
		tbody += '<td><input class="tableEntry" type="number" name="materialQuantity">'
				+ '</td>';
		tbody += '<td><input class="tableEntry" type="date"  name="materialDate" >'
				+ '</td>';
		tbody += '</tr>\n';
	}
	var tfooter = '</table>';
	document.getElementById('wrapper').innerHTML = theader + thead + tbody
			+ tfooter;
}


// function to clear the complete Gate Pass Form , after confirming from the User


function confirmClear() {
	var answer = confirm("Confirm to clear the Form??");
	if (answer) {
		var form = document
				.getElementById("gatepassMainForm");
		form.reset();
		var hide_1 = document
				.getElementById("bhelInfo");
		var hide_2 = document
				.getElementById("nonBhelInfo");
		hide_1.style.display = "none";
		hide_2.style.display = "none";
	} else {
		return false;
	}
	
}


// function to Register completed Gate Pass Form , after confirming from the User


function confirmSubmit() {
	var answer = confirm("Must check if all the details are filled. Confirm Submit ??")

	if (answer) {

		var x = document
				.getElementById("gatepassMainForm");

		var i;
		for (i = 0; i < x.length; i++) {

			if (!x.elements[i].value.localeCompare("")) {

				alert("One or more fields are empty. Please fill all the details !!");
				return false;

			}
		}

		document.getElementById("formStatus").value = "pending";
		document.getElementById("gatepassMainForm").action="<%=request.getContextPath()%>/raisegatepass";           
		document.getElementById("gatepassMainForm").method ="post";
		document.getElementById("gatepassMainForm")
				.submit();

	} else {
		return false;

	}
}


// function to save the Gate Pass Form as a Draft


function confirmSave() {
	var answer = confirm("Please note that this feature is only for bhel_person. Also you can use Save feature only once.. However you are free to fill & register it at anytime. Confirm to Save As Darft ?? ")
	if (answer) {

		document.getElementById("formStatus").value = "draft";
		document.getElementById("gatepassMainForm").action = "<%=request.getContextPath()%>/raisegatepass";
		document.getElementById("gatepassMainForm").method = "post";
		document.getElementById("gatepassMainForm").submit();

	} else {
		return false;
	}
}




// ***functions for the page gatepass_decline.jsp***



// function to clear the Reason for Cancellation
function clear(){
	var form = document.getElementById("reason");
	form.clear();
}



// ***functions for the page gatepass_approval_portal.jsp***


// function to redirect to gatepass_decline.jsp


function redirect(){
	window.location = "gatepass_decline.jsp";
}


//function to approve the Pending Gate Pass


function approve(){
	var answer = confirm("Confirm to clear the Approve??");
	if(answer)
		{
		    window.alert("Gatepass Approved Successfully");
		}
	else {
		return false;
	}
}
