package aop_step2;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Advice {
	BoardDao boardDao;
	MemberDao memberDao;
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd(E요일) hh:mm:ss:SS");
	
	public Advice(BoardDao bDao, MemberDao mDao) {
		this.boardDao = bDao;
		this.memberDao = mDao;
	}
	
	// advice 종류
	public void beforeAdvice() {
		System.out.println("before advice");
		System.out.println(sdf.format(new Date()));
		boardDao.select();			// 로그 출력과 상관없이 업무를 처리하는 부분, 당연히 select()에는 로그 출력하는 부분이 전혀 없다. 근데 로그 출력이 필요할 경우, Advice를 만든다.
	}
	
	public void afterAdvice() {
		System.out.println("after advice");
		System.out.println(sdf.format(new Date()));
		boardDao.select();
	}
	
	public void aroundAdvice() {
		System.out.println("around advice begin");
		System.out.println(sdf.format(new Date()));
		boardDao.select();
		System.out.println("around advice end");
	}
}
