package bean;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {
	BoardDao dao;
	
	public BoardController(BoardDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping(value = "/list.brd")
	public ModelAndView list(String findStr) {
		ModelAndView mv = new ModelAndView();
		
		List<BoardVo> list = dao.select(findStr);
		
		mv.addObject("list", list);
		mv.addObject("dao", dao);
		
		return mv;
	}
}