package login.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import login.bean.LoginBean;

public class LoginDao {

	String driver = Database.getdriver();
	String connectionUrl = Database.getConnectionUrl();
	String database = Database.getDatabase();
	String userid = Database.getUserId();
	String password = Database.getPassword();

	public boolean validate(LoginBean loginBean) throws ClassNotFoundException {
		boolean status = false;
		int UserID;
		String Name;
		int staffid;

		Class.forName(driver);

		try (Connection connection = DriverManager.getConnection(connectionUrl + database, userid, password);

				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection
						.prepareStatement("select * from login where username = ? and password = ? ");

		) {

			preparedStatement.setString(1, loginBean.getUsername());
			preparedStatement.setString(2, loginBean.getPassword());

			//System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			status = rs.next();
			UserID = rs.getInt("role_code");
			Name = rs.getString("firstname") + rs.getString("lastname");
			System.out.println("Name " +Name);
			staffid = rs.getInt("staff_id");
			loginBean.setstaffid(staffid);
		    loginBean.setUserID(UserID);
		    loginBean.setName(Name);
		    System.out.println("Name: " + Name);
		    System.out.println("UserID " +UserID);

		} catch (SQLException e) {
			// process sql exception
			printSQLException(e);
		}
		return status;
	}

	private void printSQLException(SQLException ex) {
		for (Throwable e : ex) {
			if (e instanceof SQLException) {
				e.printStackTrace(System.err);
				System.err.println("SQLState: " + ((SQLException) e).getSQLState());
				System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
				System.err.println("Message: " + e.getMessage());
				Throwable t = ex.getCause();
				while (t != null) {
					System.out.println("Cause: " + t);
					t = t.getCause();
				}
			}
		}
	}
}