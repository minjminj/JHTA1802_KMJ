package di_step1;

// DI가 전혀 적용되지 않았을 때 외부환경의 변화가 내부 환경에 직접적인 영향을 준다
// (즉, 외부 소스가 변경되었을때 100% 내부 소스의 수정을 요함)
public class Main {
	public Main() {
		// 만약 사용하는 DB가 바뀌면 내부 소스 다 ~~~~~ 바꿔야해요
		Oracle ora = new Oracle();
		MsSql ms = new MsSql();
		MySql my = new MySql();
		System.out.println(ora.getName());
		System.out.println(ms.getDb());
		System.out.println(my.getDbName());
	}
	
	public static void main(String[] args) {
		new Main();
	}
}
