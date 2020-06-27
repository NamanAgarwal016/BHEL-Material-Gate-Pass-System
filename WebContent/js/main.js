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
	var showDraft = document.getElementById("draftbutton");
	showDraft.style.display = "inline-block";
}
function nonBhel() {
	var content = document.getElementById("nonBhelInfo");
	content.style.display = "block";
	var hide = document.getElementById("bhelInfo");
	hide.style.display = "none";
	var hideDraft = document.getElementById("draftbutton");
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
