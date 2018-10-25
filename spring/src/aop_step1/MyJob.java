package aop_step1;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class MyJob {
	
	public MyJob() {
		ApplicationContext context = new FileSystemXmlApplicationContext("src/aop_step1/aop.xml");
		Dao dao = (BoardDao) context.getBean("boardDao");
		dao.select();
		dao.update();
		
		Main main = (Main) context.getBean("main");
		main.getBoardDao().select();
		main.getMemberDao().delete();
		main.boardDao.select();
		main.memberDao.insert();
	}
	
	
	public static void main(String[] args) {
		new MyJob();
	}
}
