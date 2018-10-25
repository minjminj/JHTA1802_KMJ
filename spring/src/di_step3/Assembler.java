package di_step3;

// 사용하려는 DB를 생성하여 리턴.. 
// open되는 소스로써 이 모듈을 사용하는 업체 혹의 업체의 개발자들은 이 소스를 통해 DB설정을 변경할 수 있다.
public class Assembler {
	public DB getDB() {
		DB db = new Oracle();
		return db;
	}
}
