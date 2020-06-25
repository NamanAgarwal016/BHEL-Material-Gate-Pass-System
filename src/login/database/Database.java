package login.database;

public class Database {
	
	static String driver = "com.mysql.jdbc.Driver";
	static String connectionUrl = "jdbc:mysql://dno6xji1n8fm828n.cbetxkdyhwsb.us-east-1.rds.amazonaws.com:3306/";
	static String database = "zvp0njb2yauy3fgk";
	static String userid = "pjyaoyeilkkbtjg8";
	static String password = "ejzn69wchxp2bv6j";
	
	public static String getdriver() {
		return driver;
	}
	public static String getConnectionUrl() {
		return connectionUrl;
	}
	public static String getDatabase() {
		return database;
	}
	public static String getUserId() {
		return userid;
	}
	public static String getPassword() {
		return password;
	}
}
