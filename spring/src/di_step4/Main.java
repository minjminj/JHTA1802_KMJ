package di_step4;

public class Main {
	public Main(DB db) {
		System.out.println(db.getName());
	}
		// 이 소스는 오픈 ㄴㄴㄴㄴㄴㄴ Assembler를 제외한 모든 소스는 오픈 ㄴㄴㄴㄴ
		// 외부조립기 main 생성자에 매개변수로 DB인터페이스를 받기때문에 외부 환경에 변화가 있을경우, 외부조립기 환경설정만 다시 하면 된다.
}
