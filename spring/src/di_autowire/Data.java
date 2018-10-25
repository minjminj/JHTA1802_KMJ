package di_autowire;

// btName과 btType에 의해서 자동으로 주입될 클래스
public class Data {
	String id;
	String pwd;
	
	public Data(String id, String pwd) {
		this.id = id;
		this.pwd = pwd;
	}
	
	// JAVA에서는 클래스 내에 재정의된 toString()이 있으면, sysout(클래스명)으로 출력하면 toString()이 리턴.
	public String toString() {
		return "id= " + id + ", pwd= " + pwd;
	}
}
