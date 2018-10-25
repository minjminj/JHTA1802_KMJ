package aop_step2;

public class MemberDao implements Dao {
	
	
	@Override
	public String select() {
		System.out.println("select문 실행");
		return null;
	}

	@Override
	public String insert() {
		System.out.println("insert문 실행");
		return null;
	}

	@Override
	public String update() {
		System.out.println("update문 실행");
		return null;
	}

	@Override
	public String delete() {
		System.out.println("delete문 실행");
		return null;
	}

	@Override
	public String view() {
		System.out.println("view문 실행");
		return null;
	}

	@Override
	public String repl() {
		System.out.println("repl문 실행");
		return null;
	}
	
}
