package aop_anno;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;

@Aspect
public class Advice{
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd(E요일) hh:mm:ss:SS");
	
	
	public String log() {
		String log = sdf.format(new Date());
		return log;
	}
	
	@Before("execution(* select(..))")
	public Object before(JoinPoint point) { // 일반 메소드 before/after지만 매개변수가 반드시 Joinpoint 이어야함.(by aspectJ)
		String log = log();
		System.out.println(log);
		return "before advice: " + log;
	}
	
	@AfterReturning("execution(* update(..))")
	public Object after(JoinPoint point) {
		String log = log();
		System.out.println(log);
		return "after advice: " + log;
	}
	
	@Around("execution(* delete(..))")
	public Object around(ProceedingJoinPoint point) { // 일반 메소드 around지만 매개변수가 반드시 ProceedingJoinPoint 이어야함.(by aspectJ)
		String log = "";
		try {
			log = log();
			String rs = (String)point.proceed();
			log += rs + log();
		} catch (Exception ex) {
			log = ex.toString();
		} finally {
			return log;
		}
	}
}
