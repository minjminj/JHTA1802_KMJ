package di_book;


import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

public class MyJob {
	public MyJob() {
		
		Resource rs = new ClassPathResource("di_book/book.xml");
		BeanFactory factory = new XmlBeanFactory(rs);
		
		// factory(xml)에서 id="main"인 bean을 가져와라. 오브젝트 타입으로 가져왔으니 Main으로 형변환.
		//Outputter o = (Outputter)factory.getBean("outputter");
		MessageBeanImpl m = (MessageBeanImpl)factory.getBean("messageBean");
		m.sayHello();
	}
	
	public static void main(String[] args) {
		new MyJob();
	}
}
