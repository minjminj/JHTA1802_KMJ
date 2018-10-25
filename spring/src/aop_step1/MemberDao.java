package aop_step1;

import java.text.SimpleDateFormat;
import java.util.Date;

public class MemberDao implements Dao {
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd(E요일) hh:mm:ss:SS");
	
	@Override
	public String select() {
		System.out.println("select문 실행");
		System.out.println(sdf.format(new Date())); // 횡단적 관심사 분리x
		return null;
	}

	@Override
	public String insert() {
		System.out.println("insert문 실행");
		System.out.println(sdf.format(new Date())); // 횡단적 관심사 분리x
		return null;
	}

	@Override
	public String update() {
		System.out.println("update문 실행");
		System.out.println(sdf.format(new Date())); // 횡단적 관심사 분리x
		return null;
	}

	@Override
	public String delete() {
		System.out.println("delete문 실행");
		System.out.println(sdf.format(new Date())); // 횡단적 관심사 분리x
		return null;
	}

	@Override
	public String view() {
		System.out.println("view문 실행");
		System.out.println(sdf.format(new Date())); // 횡단적 관심사 분리x
		return null;
	}

	@Override
	public String repl() {
		System.out.println("repl문 실행");
		System.out.println(sdf.format(new Date())); // 횡단적 관심사 분리x
		return null;
	}
	
}
