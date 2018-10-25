package bean;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	
	String driver = "oracle.jdbc.driver.OracleDriver";		// 드라이버명은 문자열 상수로 자바에 설정되어 있음.\
	String dbUrl = "jdbc:oracle:thin:@192.168.0.16:1521:xe";
	String dbUser = "coding_villain";
	String dbPwd = "cv";

	
	Connection conn;
	
	public DBConnection() {
		try {
			//Driver loading
			Class.forName(driver);
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPwd);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	
	public Connection getConn() {
		return conn;
	}
}
