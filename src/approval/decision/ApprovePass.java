package approval.decision;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import login.database.Database;

@WebServlet("/ApprovePass")
public class ApprovePass extends HttpServlet {
	private static final long serialVersionUID = 1L;      
 	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 		String GatePassNumber = request.getParameter("GatePass"); // Gate Pass Number
 		String Name = request.getParameter("Issuer"); // Name of issuer
 		String Decision = request.getParameter("Decision"); // Decision
 		String Date = request.getParameter("Date"); // Date of Issue
 		
 		// MySQL Server Details

 		String driver = Database.getdriver();
 		String connectionUrl = Database.getConnectionUrl();
 		String database = Database.getDatabase();
 		String userid = Database.getUserId();
 		String password = Database.getPassword();

		try {
			Class.forName(driver);

			Connection connection = DriverManager.getConnection(connectionUrl + database, userid, password);
			
			String insertTableSQL0 = "INSERT INTO IssuingDetail VALUES(?, ?, ?, ?,?,?);";
			PreparedStatement st0 = connection.prepareStatement(insertTableSQL0);
			st0.setString(1, Name);
			st0.setString(2, GatePassNumber);
			st0.setString(3, Decision);
			st0.setString(4, Date);
			st0.setString(5, "");
			st0.setString(6, "");
			st0.executeUpdate();
			
			String insertTableSQL = "UPDATE material SET status=? where PassNumber=?";
			PreparedStatement st = connection.prepareStatement(insertTableSQL);
			st.setString(1, Decision);
			st.setString(2, GatePassNumber);
			st.executeUpdate();

			String insertTableSQL1 = "UPDATE material_details SET status=? where gatepass=?";
			PreparedStatement st1 = connection.prepareStatement(insertTableSQL1);
			st1.setString(1, Decision);
			st1.setString(2, GatePassNumber);
			st1.executeUpdate();

			String insertTableSQL2 = "UPDATE receiver SET status=? where gatepass=?";
			PreparedStatement st2 = connection.prepareStatement(insertTableSQL2);
			st2.setString(1, Decision);
			st2.setString(2, GatePassNumber);
			st2.executeUpdate();

			String insertTableSQL3 = "SELECT * from bhel_person where gatepass=?";
			PreparedStatement st3 = connection.prepareStatement(insertTableSQL3);
			st3.setString(1, GatePassNumber);
			ResultSet rs = st3.executeQuery();
			
			if (rs.next() == false) {
				String insertTableSQL4 = "UPDATE nonbhel_person SET status=? where gatepass=?";
				PreparedStatement st4 = connection.prepareStatement(insertTableSQL4);
				st4.setString(1, Decision);
				st4.setString(2, GatePassNumber);
				st4.executeUpdate();
			} else {
				String insertTableSQL5 = "UPDATE bhel_person SET status=? where gatepass=?";
				PreparedStatement st5 = connection.prepareStatement(insertTableSQL5);
				st5.setString(1, Decision);
				st5.setString(2, GatePassNumber);
				st5.executeUpdate();
			}
			RequestDispatcher view = request.getRequestDispatcher("gatepass_approval_home.jsp");
			view.forward(request, response);

		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, e.getMessage());
			RequestDispatcher view = request.getRequestDispatcher("gatepass_approval_home.jsp");
			view.forward(request, response);
		}
	}
 		
}
