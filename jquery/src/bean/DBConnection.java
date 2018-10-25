package bean;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	
	String driver = "oracle.jdbc.driver.OracleDriver";		// 드라이버명은 문자열 상수로 자바에 설정되어 있음.\
	String dbUrl = "jdbc:oracle:thin:@localhost:1521:xe";
	String dbUser = "hr";
	String dbPwd = "hr";

	Connection conn;
	
	public DBConnection() {
		
		try{
			//driver load
			Class.forName(driver);
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPwd);
		} catch(Exception ex){
			ex.printStackTrace();
		}
	}
	
	public Connection getConn() {
		return conn;
	}
}
