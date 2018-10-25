package di_autowire;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class AutowireMain {
	public AutowireMain() {
		// byName
		System.out.println("byName에 의한 자동 주입 결과");
		ApplicationContext factory = new FileSystemXmlApplicationContext("src/di_autowire/autowire.xml");
		AutowireByName bean = (AutowireByName) factory.getBean("byName");
		
		// byType
		System.out.println("byType에 의한 자동 주입 결과");
		factory = new FileSystemXmlApplicationContext("src/di_autowire/autowiretype.xml");
		AutowireByType bean2 = (AutowireByType) factory.getBean("byType");
	
		// annotation
		System.out.println("@Autowired(annotation)에 의한 자동 주입 결과");
		factory = new FileSystemXmlApplicationContext("src/di_autowire/autowire_anno.xml");
		AutowireAnnotation bean3 = (AutowireAnnotation) factory.getBean("anno");
	}
	
	public static void main(String[] args) {
		new AutowireMain();
	}
}
