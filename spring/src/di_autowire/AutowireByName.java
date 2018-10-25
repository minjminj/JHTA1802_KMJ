package di_autowire;

// Di를 xml의 id와 필드의 이름과 도일한 bean을 자동으로 처리하는 방식
public class AutowireByName {
	Data data;
	
	public void setData(Data d) {
		this.data = d;
		System.out.println(d);
	}
}
