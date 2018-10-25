package bean;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller // spring-mvc-servlet에서 controller로 인식하게 만들어주는 역할!
public class StudentController {
	StudentDao dao;
	
	public StudentController(StudentDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping(value="/list.std")
	public ModelAndView select(String findStr) {
		ModelAndView mv = new ModelAndView();
		
		List<StudentVo> list = dao.select(findStr);
		
		mv.addObject("list", list);
		mv.addObject("dao", dao);
		//mv.addObject("nowPage", dao.getNowPage());
		mv.setViewName("list");
		
		return mv;
	}
	
	@RequestMapping(value="/insert.std")
	public ModelAndView insert(HttpServletRequest req) {
								// 메소드의 매개변수 타입이 HttpServlerRequest라면 알아서 reqeust를 실행.
		ModelAndView mv = new ModelAndView();
		
		String msg = dao.insert(req);
		
		mv.addObject("msg", msg);
		mv.setViewName("insert_result");
		
		return mv;
	}
	
	@RequestMapping(value="/view.std")
	public ModelAndView view(String id) {
		ModelAndView mv = new ModelAndView();
		
		StudentVo vo = dao.view(id);
		
		mv.addObject("vo", vo);
		mv.setViewName("view");
		
		return mv;
	}
	
	@RequestMapping(value="/modify.std")
	public ModelAndView modify(String id) {
		ModelAndView mv = new ModelAndView();
		
		StudentVo vo = dao.view(id);
		
		mv.addObject("vo", vo);
		mv.setViewName("modify");
		
		return mv;
	}
	
	@RequestMapping(value="/update.std")
	public ModelAndView update(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		
		String msg = dao.update(req);
		
		mv.addObject("msg", msg);
		mv.setViewName("modify_result");
		
		return mv;
	}
	
	@RequestMapping(value="/delete.std")
	public ModelAndView delete(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		
		String msg = dao.delete(req);
		mv.addObject("msg", msg);
		mv.setViewName("delete_result");
		
		return mv;
	}
	
	@RequestMapping(value="/login.std")
	public ModelAndView login(HttpServletRequest req, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		String msg = "";
		boolean b = dao.login(id, pwd);
		if (b) {
			session.setAttribute("id", id);
			mv.setViewName("../index");
		} else {
			mv.setViewName("login");
			msg = "아이디 또는 암호를 확인해주세요.";
			mv.addObject("msg", msg);
		}
		
		return mv;
	}
	
	@RequestMapping(value="/logout.std")
	public ModelAndView logout(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
			session.removeAttribute("id");
			mv.setViewName("../index");
		
		return mv;
	}
	
	@RequestMapping(value="/find.std")
	public ModelAndView find(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		String id = req.getParameter("id");
		System.out.println(id);
		String phone = req.getParameter("phone");
		System.out.println(phone);
		StudentVo vo = dao.find(id, phone);
		
		dao.mail(vo, req);
		
		mv.addObject("vo", vo);
		mv.setViewName("find_result");
		
		
		return mv;
	}
}
