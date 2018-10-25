package bean;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

public class EmpDao {
	SqlSession s;
	
	public EmpDao() {
		
		try {
			// mybatis 연결하기.
		s = BeginFactory.getFatory().openSession();
	
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public EmpVo select(int id) {
		
			// s(SqlSessionFactory-mybatis_config.xml에 의해 만들어진)가 mapping된 emp.xml에서
			// emp이름을 가진 mapper의 select를 id를 파라미터로 하여 실행시킴.
		EmpVo vo = (EmpVo)s.selectOne("emp.select", id);
		s.close();
		// 동시다발적으로 다수의 유저가 session을 이용하려 할 경우, close()를 하지 않으면 session의 크기가 다 차버려서 오류가 발생될 수 있음.
		
		return vo;
	}
	
	public List<EmpVo> select2(String findStr){
		
		List<EmpVo> list = (ArrayList)s.selectList("emp.select2", findStr);
			// "%"+findStr+"%" 로 emp.xml에서 findStr 사용시 '%'||#{findStr}||'%'로 하지 않아도 like가능!
		s.close();
		
		return list;
	}
	
	public List<EmpVo> selectHire(String year){
		List<EmpVo> list = s.selectList("emp.select_hire", year);
		s.close();
	
		return list;
		
	}
	
	public List<EmpVo> select_if(String findStr){
		
		// 만약 '월'로 검색시 1월과 01월을 같은 것으로 인식하려고 할때, like없이 ...
		// findStr = (findStr.length)==1 ? 0+findStr : findStr
		// 입력받은 findStr이 한자리면 0을 붙여주고 아니면 그냥 입력값 자체로 사용
		List<EmpVo> list = s.selectList("emp.select_if", findStr);
		s.close();
		
		return list;
	}

	public List<EmpVo> select_where(String findStr, String hire){
		EmpVo vo = new EmpVo();
		vo.first_name= findStr;
		vo.hire_date = hire;
		
		List<EmpVo> list = s.selectList("emp.select_where", vo);
		s.close();
		
		return list;
	}
	
	public List<DepartmentVo> select_dept(){
		
		List<DepartmentVo> list = s.selectList("emp.dept_list");
		
		s.close();
		
		return list;
	}
	
	public List<EmpVo> select_foreach(String[] dept){ // checkbox는 배열형태로 값을 갖기 때문에
		List<String> temp = Arrays.asList(dept);
		List<EmpVo> list = s.selectList("emp.select_foreach", temp);
		
		s.close();
		
		return list;
	}
}
