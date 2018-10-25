package aop_step2;

public class Main {
	Advice advice;
	
	public Main(Advice ad) {
		this.advice = ad;
		
		advice.beforeAdvice();
		advice.afterAdvice();
		advice.aroundAdvice();
	}
}
