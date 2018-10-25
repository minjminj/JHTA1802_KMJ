package di_autowire;

import java.sql.Connection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

public interface DB {
	public Connection getConn();
	
	public List<DBConn.EmpVo> select();
	
	public DBConn.EmpVo insert();
	
	public DBConn.EmpVo update(HttpServletRequest req);
	
	public String delete();
	
	public DBConn.EmpVo view();
	
	public DBConn.EmpVo repl(int employee_id);
}
