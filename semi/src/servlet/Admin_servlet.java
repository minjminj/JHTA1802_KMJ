package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Cud_dao;
import bean.Cud_vo;
import bean.Prod_dao;
import bean.Prod_vo;

public class Admin_servlet extends HttpServlet {
	
	String index = "index.jsp?content=";
	String content = "";
	String msg = "";
	
	
	
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("text/html);charset=utf-8");
		
		String temp = req.getServletPath();
		String url = temp.substring(1, temp.indexOf("."));
		
		switch(url) {
		
		case "prod":
			prod_admin(req, resp);
			content = "admin/admin_prod.jsp";
			break;
		case "cud":
			cud_admin(req, resp);
			content = "admin/admin_cud.jsp";
			break;
		case "order":
			order_admin(req, resp);
			content = "admin/admin_order.jsp";
			break;
		case "prodRegisterR":
			prodRegisterR(req, resp);
			content = "admin/admin_prod.jsp";
			break;
		case "prodView":
			prodView(req, resp);
			content = "admin/admin_prod.jsp";
			break;
		case "prodModifyR":
			prodModifyR(req, resp);
			content = "admin/admin_prod.jsp";
			break;
		case "prodDelete":
			prodDelete(req, resp);
			content = "admin/admin_prod.jsp";
			break;
		case "cudDelete":
			cudDelete(req, resp);
			content = "admin/admin_cud.jsp";
			break;
			
		}
		
		req.setAttribute("content", content);
		req.setAttribute("msg", msg);
		RequestDispatcher disp = req.getRequestDispatcher(index + content);
		disp.forward(req, resp);
		
	}







	private void prod_admin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Prod_dao dao = new Prod_dao();
		String findStr = "";
		int nowPage = 1;
		if(req.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(req.getParameter("nowPage"));
		}else {
			nowPage = 1;
		}
		
		if(req.getParameter("find_str") != null) {
			findStr = req.getParameter("find_str");
		}
		dao.setNowPage(nowPage);
		List<Prod_vo> list = dao.select(findStr);
		req.setAttribute("dao", dao);
		req.setAttribute("list", list);
		
	}



	private void cud_admin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Cud_dao dao = new Cud_dao();
		String findStr = "";
		int nowPage = 1;
		if(req.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(req.getParameter("nowPage"));
		}else {
			nowPage = 1;
		}
		
		if(req.getParameter("find_str") != null) {
			findStr = req.getParameter("find_str");
		}
		dao.setNowPage(nowPage);
		List<Cud_vo> list = dao.select(findStr);
		req.setAttribute("dao", dao);
		req.setAttribute("list", list);
	}


	private void order_admin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}
	
	
	private void prodRegisterR(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/*System.out.println("서블릿은 타니?");*/
		Prod_dao dao = new Prod_dao();
		
		if(dao.register(req)) {
			msg = "입력성공";
			prod_admin(req, resp);
		}else {
			msg = "오류발생";
			prod_admin(req, resp);
		}
	}
	
	
	private void prodView(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int pCode = Integer.parseInt(req.getParameter("prod_code"));
		Prod_dao dao = new Prod_dao();
		Prod_vo vo = dao.view(pCode);
		req.setAttribute("pvo", vo);
		
	}
	
	
	private void prodModifyR(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}


	private void prodDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int pCode = Integer.parseInt(req.getParameter("prod_code"));
		
		Prod_dao dao = new Prod_dao();
		
		if (dao.delete(pCode)) {
			msg = "정상적으로 삭제됨.";
			prod_admin(req, resp);
			System.out.println(msg);
		} else {
			msg = "삭제중 오류 발생.";
			prod_admin(req, resp);
			System.out.println(msg);
		}
	}



	private void cudDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int cCode = Integer.parseInt(req.getParameter("cud_code"));
		
		Cud_dao dao = new Cud_dao();
		

		
		String msg = "";

		if (dao.delete(cCode)) {
			msg = ("정상적으로 삭제됨.");
			System.out.println(msg);
		} else {
			msg = ("삭제중 오류 발생.");
			System.out.println(msg);
		}
	}



}
