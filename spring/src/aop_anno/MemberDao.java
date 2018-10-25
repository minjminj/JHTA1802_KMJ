package aop_anno;

public class MemberDao implements Dao {
	
	
	@Override
	public String select() {
		String rs = ("MemberDao에서 select문 실행");
		return rs;
	}

	@Override
	public String insert() {
		String rs = ("MemberDao에서 insert문 실행");
		return rs;
	}

	@Override
	public String update() {
		String rs = ("MemberDao에서 update문 실행");
		return rs;
	}

	@Override
	public String delete() {
		String rs = ("MemberDao에서 delete문 실행");
		return rs;
	}

	@Override
	public String view() {
		String rs = ("MemberDao에서 view문 실행");
		return rs;
	}

	@Override
	public String repl() {
		String rs = ("MemberDao에서 repl문 실행");
		return rs;
	}
	
}
