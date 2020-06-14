package Security.detail;

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

/**
 * Servlet implementation class Returning
 */
@WebServlet("/Leaving")
public class Leaving extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String Gate = request.getParameter("GatePass");
		System.out.println(Gate);
		
		// MySQL Server Details

				String driver = "com.mysql.jdbc.Driver";
				String connectionUrl = "jdbc:mysql://dno6xji1n8fm828n.cbetxkdyhwsb.us-east-1.rds.amazonaws.com:3306/";
				String database = "zvp0njb2yauy3fgk";
				String userid = "pjyaoyeilkkbtjg8";
				String password = "ejzn69wchxp2bv6j";

				try {
					Class.forName(driver);

					Connection connection = DriverManager.getConnection(connectionUrl + database, userid, password);
					String insertTableSQL = "UPDATE material SET status=? where PassNumber=?";
					PreparedStatement st = connection.prepareStatement(insertTableSQL);
					st.setString(1, "Left the Premises");
					st.setString(2, Gate);
					st.executeUpdate();
					
					String insertTableSQL1 = "UPDATE material_details SET status=? where gatepass=?";
					PreparedStatement st1 = connection.prepareStatement(insertTableSQL1);
					st1.setString(1, "Left the Premises");
					st1.setString(2, Gate);
					st1.executeUpdate();
					
					String insertTableSQL2 = "UPDATE receiver SET status=? where gatepass=?";
					PreparedStatement st2 = connection.prepareStatement(insertTableSQL2);
					st2.setString(1, "Left the Premises");
					st2.setString(2, Gate);
					st2.executeUpdate();
					
					String insertTableSQL3 = "SELECT * from bhel_person where gatepass=?";
					PreparedStatement st3 = connection.prepareStatement(insertTableSQL3);
					st3.setString(1, Gate);
					ResultSet rs = st3.executeQuery();
					if (rs.next() == false) {
					    String insertTableSQL4 = "UPDATE nonbhel_person SET status=? where gatepass=?";
						PreparedStatement st4 = connection.prepareStatement(insertTableSQL4);
						st4.setString(1, "Left the Premises");
						st4.setString(2, Gate);
						st4.executeUpdate();
					}
					else {
						 String insertTableSQL5 = "UPDATE bhel_person SET status=? where gatepass=?";
							PreparedStatement st5 = connection.prepareStatement(insertTableSQL5);
							st5.setString(1, "Left the Premises");
							st5.setString(2, Gate);
							st5.executeUpdate();		
					}
					RequestDispatcher view = request.getRequestDispatcher("gatepassSecurity.jsp");
					view.forward(request, response);
					
	} catch (Exception e) {
		JOptionPane.showMessageDialog(null, e.getMessage());
		RequestDispatcher view = request.getRequestDispatcher("gatepassSecurity.jsp");
		view.forward(request, response);
	}
				}
	}
