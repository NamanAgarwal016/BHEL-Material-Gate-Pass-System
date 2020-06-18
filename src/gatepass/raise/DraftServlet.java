package gatepass.raise;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

@WebServlet("/DraftServlet")
public class DraftServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);

		String status = "Draft";
		// All integer Data

		int numberofmaterials = Integer.parseInt(request.getParameter("noOfItems"));
		int staff_id = (Integer) session.getAttribute("ID"); // Staff ID

		// Receiver Details

		String PassNumber = (String) request.getParameter("pass_Number"); // Pass Number
		String InitiatingOfficer = (String) request.getParameter("initiating_Officer"); // Name
		System.out.println(PassNumber);
		System.out.println(InitiatingOfficer);
		
		String RecName = request.getParameter("personName"); // Receiver Name
		String RecAdd = request.getParameter("personAdd"); // Receiver Address
		String RecDesig = request.getParameter("personDesg"); // Receiver Designation
		String RecCity = request.getParameter("personCity"); // Receiver City
		String RecDept = request.getParameter("personDept"); // Receiver Department
		String RecState = request.getParameter("personState"); // Receiver State
		String RecCompany = request.getParameter("personCName"); // Receiver Company
		String RecMail = request.getParameter("personMail"); // Reciever Mail
		String TypePerson = request.getParameter("personType"); // Type of person
		String RecPincode = request.getParameter("personPin"); // Receiver Pin Code
		String RecPhone = request.getParameter("personPhone"); // Receiver Phone

		// Bhel Person Details

		String BName = request.getParameter("bhelName");
		String BDesig = request.getParameter("bhelDeg");
		String BDept = request.getParameter("bhelDept");

		// Non Bhel Person Details

		String NBName = request.getParameter("NbhelName");
		String NBCompany = request.getParameter("bhelCompany");
		String NBAddress = request.getParameter("bhelAddress");

		// Details of material

		String Details = request.getParameter("custodian");

		// Array of datasets

		String[] Materials = request.getParameterValues("materialInfo"); // Array containing Material Name list
		String[] Unit = request.getParameterValues("materialUnit"); // Array containing Unit
		String[] Quantity = request.getParameterValues("materialQuantity"); // Array containing Quantity in string
		String[] Date = request.getParameterValues("materialDate"); // date of return

		// MySQL Server Details

		String driver = "com.mysql.jdbc.Driver";
		String connectionUrl = "jdbc:mysql://dno6xji1n8fm828n.cbetxkdyhwsb.us-east-1.rds.amazonaws.com:3306/";
		String database = "zvp0njb2yauy3fgk";
		String userid = "pjyaoyeilkkbtjg8";
		String passwordd = "ejzn69wchxp2bv6j";

		try {
			Class.forName(driver);

			Connection connection = DriverManager.getConnection(connectionUrl + database, userid, passwordd);

			// Inserting Material details
			String insertTableSQL0 = "delete from material where PassNumber='"+ PassNumber +"' and status='"+ status +"'";
			PreparedStatement st0 = connection.prepareStatement(insertTableSQL0);
			st0.executeUpdate();
			
			
			for (int i = 0; i < numberofmaterials; i++) {
				
				String insertTableSQL = "INSERT INTO material VALUES(?, ?, ?, ?, ?, ?, ?, ?);";
				PreparedStatement st = connection.prepareStatement(insertTableSQL);
				st.setString(1, PassNumber);
				st.setString(2, "Pending");
				st.setString(3, InitiatingOfficer);
				st.setInt(4, staff_id);
				st.setString(5, Materials[i]);
				st.setString(6, Quantity[i]);
				st.setString(7, Unit[i]);
				st.setString(8, Date[i]);
				st.executeUpdate();	
			}
			System.out.println("Done material table");
			
			// Inserting Receiver Details


			String insertTableSQL2 ="Update receiver set gatepass=?,status=?,name=?,designation=?,dept=?,company=?,contact=?,email=?,address=?,city=?,state=?,pincode=? where gatepass='" + PassNumber +"'";
			
			//String insertTableSQL2 = "INSERT INTO receiver VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
			PreparedStatement st2 = connection.prepareStatement(insertTableSQL2);
			st2.setString(1, PassNumber);
			st2.setString(2, "Pending");
			st2.setString(3, RecName);
			st2.setString(4, RecDesig);
			st2.setString(5, RecDept);
			st2.setString(6, RecCompany);
			st2.setString(7, RecPhone);
			st2.setString(8, RecMail);
			st2.setString(9, RecAdd);
			st2.setString(10, RecCity);
			st2.setString(11, RecState);
			st2.setString(12, RecPincode);
			st2.executeUpdate();
			System.out.println("Done receicver table");
			// Checking for Bhel or NonBhel and inserting into respective tables

			if ("bhelPerson".equals(TypePerson)) {
				int BStaffNo = Integer.parseInt(request.getParameter("bhelStaffNo"));

				String insertTableSQL3 ="Update bhel_person set gatepass=?,status=?,staff_id=?,name=?,designation=?,department=? where gatepass='" + PassNumber +"'";
				
				//String insertTableSQL3 = "INSERT INTO bhel_person VALUES(?, ?, ?, ?, ?, ?);";
				PreparedStatement st3 = connection.prepareStatement(insertTableSQL3);
				st3.setString(1, PassNumber);
				st3.setString(2, "Pending");
				st3.setInt(3, BStaffNo);
				st3.setString(4, BName);
				st3.setString(5, BDesig);
				st3.setString(6, BDept);
				st3.executeUpdate();
				System.out.println("Done Bhel person table");
			} else if ("nonBhelPerson".equals(TypePerson)) {

				String insertTableSQL4 ="Update nonbhel_person set gatepass=?,status=?,name=?,company=?,address=? where gatepass='" + PassNumber +"'";
				
				//String insertTableSQL4 = "INSERT INTO nonbhel_person VALUES(?, ?, ?, ?, ?);";
				PreparedStatement st4 = connection.prepareStatement(insertTableSQL4);
				st4.setString(1, PassNumber);
				st4.setString(2, "Pending");
				st4.setString(3, NBName);
				st4.setString(4, NBCompany);
				st4.setString(5, NBAddress);
				st4.executeUpdate();
				System.out.println("Done non bhel person table");
			}

			// Inserting Custodian Details into table


			String insertTableSQL5 ="Update material_details set gatepass=?,status=?,Details=? where gatepass='" + PassNumber +"'";
			
			//String insertTableSQL5 = "INSERT INTO material_details VALUES(?, ?, ?);";
			PreparedStatement st5 = connection.prepareStatement(insertTableSQL5);
			st5.setString(1, PassNumber);
			st5.setString(2, "Pending");
			st5.setString(3, Details);
			st5.executeUpdate();
			System.out.println("Done material detials custodian table");

			request.setAttribute("finalPassNumber", PassNumber);
			RequestDispatcher view = request.getRequestDispatcher("DraftSuccess.jsp");
			view.forward(request, response);

		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, e.getMessage());
			RequestDispatcher view = request.getRequestDispatcher("gatepass_editDraft.jsp");
			view.forward(request, response);
		}
	}
}
