package aop_step1;

public class Main {
	Dao memberDao;
	Dao boardDao;
	
	
	public Dao getMemberDao() {
		return memberDao;
	}
	public void setMemberDao(Dao memberDao) {
		this.memberDao = memberDao;
	}
	public Dao getBoardDao() {
		return boardDao;
	}
	public void setBoardDao(Dao boardDao) {
		this.boardDao = boardDao;
	}


}
