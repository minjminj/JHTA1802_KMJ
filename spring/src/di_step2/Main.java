package di_step2;

public class Main {
	public Main() {
		Oracle ora = new Oracle(); 	// 1)
		MsSql ms = new MsSql();
		MySql my = new MySql();
		DB db = new MySql();		// 2)각 해당하는 DB의 객체로 오브젝트 생성하지만 하나의 변수로 소스를 작성하기 때문에 효율적
		
		System.out.println(ora.getName());
		System.out.println(ms.getName());
		System.out.println(my.getName());
		System.out.println(db.getName());
	}
	
	public static void main(String[] args) {
		new Main();
	}
}
