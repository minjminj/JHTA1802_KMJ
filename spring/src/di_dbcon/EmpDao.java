package di_dbcon;

public class EmpDao {
	private DB db;
	
	public EmpDao(DB a) {
		this.db = a;
		a.getConn();
//		System.out.println(a.view().employee_id);
//		System.out.println(a.view().first_name);
//		System.out.println(a.view().Salary);
		
//		System.out.println(a.insert().employee_id);
//		System.out.println(a.insert().first_name);
//		System.out.println(a.insert().salary);
		
		System.out.println(a.delete()); 
	}

	public DB getDb() {
		return db;
	}

	public void setDb(DB db) {
		this.db = db;
	}
	
}
