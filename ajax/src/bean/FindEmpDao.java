package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class FindEmpDao {
	
	Connection conn;
	
	public FindEmpDao() {
		conn = new DBConnection().getConn();
	}

	public List<FindEmpVo> select(String findStr){
		List<FindEmpVo> list = new ArrayList<>();
		
		String sql = "select employee_id, first_name, phone_number, salary, email from employees "
				+ "where lower(first_name) like lower(?) or lower(last_name) like lower(?) or phone_number like ? or lower(email) like lower(?)";
																									// lower (first_name) like lower(?)
		
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + findStr + "%");
			ps.setString(2, "%" + findStr + "%");
			ps.setString(3, "%" + findStr + "%");
			ps.setString(4, "%" + findStr + "%");
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				FindEmpVo vo = new FindEmpVo();
				vo.setEmpId(rs.getInt("employee_id"));
				vo.setName(rs.getString("first_name"));
				vo.setPhone(rs.getString("phone_number"));
				vo.setSalary(rs.getLong("salary"));
				vo.setEmail(rs.getString("email"));
				
				list.add(vo);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			list = null;
		} finally {
			return list;
		}
		
	}
}

