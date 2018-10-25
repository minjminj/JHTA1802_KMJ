package aop_step2;

public class BoardDao implements Dao {
		
	
	@Override
	public String select() {
		System.out.println("게시판에서 select문 실행");
		return null;
	}
		@Override
	public String insert() {
		System.out.println("게시판에서 insert문 실행");
		return null;
	}
		@Override
	public String update() {
		System.out.println("게시판에서 update문 실행");
		return null;
	}
		@Override
	public String delete() {
		System.out.println("게시판에서 delete문 실행");
		return null;
	}
		@Override
	public String view() {
		System.out.println("게시판에서 view문 실행");
		return null;
	}
		@Override
	public String repl() {
		System.out.println("게시판에서 repl문 실행");
		return null;
	}
		
}
