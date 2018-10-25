package aop_anno;

public class BoardDao implements Dao {
		
	
	@Override
	public String select() {
		String rs = ("게시판에서 select문 실행");
		return rs;
	}
		@Override
	public String insert() {
		String rs = ("게시판에서 insert문 실행");
		return rs;
	}
		@Override
	public String update() {
		String rs = ("게시판에서 update문 실행");
		return rs;
	}
		@Override
	public String delete() {
		String rs = ("게시판에서 delete문 실행");
		return rs;
	}
		@Override
	public String view() {
		String rs = ("게시판에서 view문 실행");
		return rs;
	}
		@Override
	public String repl() {
		String rs = ("게시판에서 repl문 실행");
		return rs;
	}
		
}
