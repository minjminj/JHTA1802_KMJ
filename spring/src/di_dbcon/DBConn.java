package di_dbcon;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;


public class DBConn implements DB{
	
	String driver = "oracle.jdbc.driver.OracleDriver";		// 드라이버명은 문자열 상수로 자바에 설정되어 있음.\
	String dbUrl = "jdbc:oracle:thin:@localhost:1521:xe";
	String dbUser = "hr";
	String dbPwd = "hr";
	String msg;
	
	String findStr = "";
	int id = 0;
	String name = "";
	String sal = "";
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSal() {
		return sal;
	}
	public void setSal(String sal) {
		this.sal = sal;
	}
	public String getFindStr() {
		return findStr;
	}
	public void setFindStr(String findStr) {
		this.findStr = findStr;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	public class EmpVo {
		// sql 변수
		int employee_id;
		String first_name;
		String salary;
		
		
		// sql 변수들의 getter , setter
		public int getEmployee_id() {
			return employee_id;
		}
		public void setEmployee_id(int employee_id) {
			this.employee_id = employee_id;
		}
		public String getFirst_name() {
			return first_name;
		}
		public void setFirst_name(String first_name) {
			this.first_name = first_name;
		}
		public String getSalary() {
			return salary;
		}
		public void setSalary(String salary) {
			this.salary = salary;
		}
	}
	
	Connection conn;
	
	PreparedStatement ps;
	ResultSet rs;
	
	
	public DBConn() {
		try {
			// driver loading
			synchronized (this) {
				Class.forName(driver);
				conn = DriverManager.getConnection(dbUrl, dbUser, dbPwd);
			}
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	
	@Override
	public Connection getConn() {
		if (conn != null) {
			msg = "성공";
		} else {
			msg = "실패";
		}
		System.out.println(msg);
		return conn;
	}

	@Override
	public List<DBConn.EmpVo> select() {
		List<EmpVo> list = new ArrayList<>();
		
		String sql = "select employee_id, first_name, salary from emp2 where first_name like ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + this.findStr + "%");
			
			rs = ps.executeQuery();
			while(rs.next()) {
				EmpVo vo = new EmpVo();
				vo.setEmployee_id(rs.getInt("employee_id"));
				vo.setFirst_name(rs.getString("first_name"));
				vo.setSalary(rs.getString("salary"));
				
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public DBConn.EmpVo insert() {
		EmpVo vo = null;
		String sql = "insert into emp2 values(?, ?, ?)";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ps.setString(2, name);
			ps.setString(3, sal);
			
			int cnt = ps.executeUpdate();
			if( cnt > 0) {
				vo = new EmpVo();
				vo.setEmployee_id(id);
				vo.setFirst_name(name);
				vo.setSalary(sal);
			}
		} catch (SQLException e) {
    			e.printStackTrace();
		}
		
		return vo;
	}

	@Override
	public DBConn.EmpVo update(HttpServletRequest req) {
		EmpVo vo = null;
		return vo;
	}

	@Override
	public String delete() {
		String msg = "";
		String sql = "delete emp2 where employee_id = ?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			
			int cnt = ps.executeUpdate();
			if (cnt > 0) {
				msg = "삭제됨";
			} else {
				msg = "삭제실패";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return msg;
	}

	@Override
	public DBConn.EmpVo view() {
		EmpVo vo = null;
		String sql = "select employee_id, first_name, salary from emp2 where employee_id = ?";
		
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, this.id);
			
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				vo = new EmpVo();
				vo.setEmployee_id(rs.getInt("employee_id"));
				vo.setFirst_name(rs.getString("first_name"));
				vo.setSalary(rs.getString("salary"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return vo;
	}

	@Override
	public DBConn.EmpVo repl(int employee_id) {
		EmpVo vo = null;
		return vo;
	}

}
