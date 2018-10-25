package di_step4;


import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

public class MyJob {
	public MyJob() {
		
		Resource rs = new ClassPathResource("di_step4/assembler.xml");
		BeanFactory factory = new XmlBeanFactory(rs);
		
		// factory(xml)에서 id="main"인 bean을 가져와라. 오브젝트 타입으로 가져왔으니 Main으로 형변환.
		Main m = (Main)factory.getBean("main");
			// 지금은 getName()밖에 없으니까 m.getName()안해도 괜찮지만 여러 메소드가 있을경우 m.~~~() 사용하면 ok!
	}
	
	public static void main(String[] args) {
		new MyJob();
	}
}
