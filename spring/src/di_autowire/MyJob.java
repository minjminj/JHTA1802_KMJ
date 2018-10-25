package di_autowire;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class MyJob {
	
	ApplicationContext factory = new FileSystemXmlApplicationContext("src/di_dbcon/dbcon.xml");
	
	EmpDao dao = (EmpDao)factory.getBean("empdao");

	public static void main(String[] args) {
		new MyJob();
	}
}
