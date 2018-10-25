package di_autowire;

public class AutowireByType {
	Data d1;
	
	public void setABc(Data d) { // 필드변수명과 setter가 이상한 이름이어도 매개변수 타입은 반드시 Data여야 한다.
								// autowire byType은 타입에 의해 수행되는 거니까
		this.d1 = d;
		System.out.println(d);
	}
}
