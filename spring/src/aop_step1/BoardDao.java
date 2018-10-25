package aop_step1;

import java.text.SimpleDateFormat;
import java.util.Date;

public class BoardDao implements Dao {
		
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd(E요일) hh:mm:ss:SS");
	
	@Override
	public String select() {
		System.out.println("게시판에서 select문 실행");
		System.out.println(sdf.format(new Date())); // 횡단적 관심사 분리
		return null;
	}
		@Override
	public String insert() {
		System.out.println("게시판에서 insert문 실행");
		System.out.println(sdf.format(new Date())); // 횡단적 관심사 분리
		return null;
	}
		@Override
	public String update() {
		System.out.println("게시판에서 update문 실행");
		System.out.println(sdf.format(new Date())); // 횡단적 관심사 분리
		return null;
	}
		@Override
	public String delete() {
		System.out.println("게시판에서 delete문 실행");
		System.out.println(sdf.format(new Date())); // 횡단적 관심사 분리
		return null;
	}
		@Override
	public String view() {
		System.out.println("게시판에서 view문 실행");
		System.out.println(sdf.format(new Date())); // 횡단적 관심사 분리
		return null;
	}
		@Override
	public String repl() {
		System.out.println("게시판에서 repl문 실행");
		System.out.println(sdf.format(new Date())); // 횡단적 관심사 분리
		return null;
	}
		
}
