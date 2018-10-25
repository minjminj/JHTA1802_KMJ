package bean;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller // annotation을 빼먹으면 dispatcher가 controller를 인식하지 못함.
public class MvcController {

	@RequestMapping(value="/gugudan.min")  // value가 gugugdan.hta라는 요청이 들어오면, 이라는 의미
	public ModelAndView gugudan(int dan) {
		ModelAndView mv = new ModelAndView();
			// Model은 data 
		StringBuilder sb = new StringBuilder();
		
		for (int i=1 ; i<=9 ; i++) {
			int j = dan * i;
			String temp = String.format("%d * %d = %d<br/>", dan, i, j);
			sb.append(temp);
		}
		mv.addObject("result", sb.toString()); // gugudan_result에 값을 전달해주는 역할 <MODEL>.
		mv.setViewName("gugudan_result"); // <VIEW>.
		return mv;
	}
	
	@RequestMapping(value="/hap.min")
	public ModelAndView hap(int x, int y) {
		ModelAndView mv = new ModelAndView();
		StringBuilder sb = new StringBuilder();
		int h = 0;
		for (int i=x ; i<=y ; i++) {
			h += i;
		}
		String temp = String.format("%d ~ %d 까지 합 =  %d<br/>", x, y, h);
		sb.append(temp);
		
		mv.addObject("hap", sb.toString()); // gugudan_result에 값을 전달해주는 역할 <MODEL>.
		mv.setViewName("hap_result"); // <VIEW>.
		return mv;
	}
	
	@RequestMapping(value="/amt.min")
	public ModelAndView amt(int amt, int ea) {
		ModelAndView mv = new ModelAndView();
		TotVo vo = new TotVo();
		
		int price = amt * ea;
		double tax = price * 0.1;
		double total = price + tax;
		
		String s_price = String.format("%d * %d = %d<br/>", amt, ea, price);
		String s_tax = String.format("%d * 0.1 = %10.2f<br/>", amt, ea, tax);
		String s_total = String.format("%d + %10.2f = %10.2f<br/>", price, tax, total);
		
		vo.setPrice(s_price);
		vo.setTax(s_tax);
		vo.setTotal(s_total);
		mv.addObject("price", vo.getPrice()); 
		mv.addObject("tax", vo.getTax());
		mv.addObject("total", vo.getTotal());
		
		mv.setViewName("amount_result"); // <VIEW>.
		return mv;
	}
}
