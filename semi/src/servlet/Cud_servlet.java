package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Cud_dao;
import bean.Cud_vo;

public class Cud_servlet extends HttpServlet{
	
	String index = "index.jsp?content=";
	String content = "";
	String msg = "";
	
	Cud_dao dao = new Cud_dao(); 
	
	@Override
	public void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("text/html;charset=utf-8");
		
		String temp = req.getServletPath();
		String url = temp.substring(1, temp.indexOf("."));
		
		switch(url) {
		
		case "register":
			register(req, resp);
			content = "member/register.jsp";
			break;
		case "registerR":
			registerR(req, resp);
			content = "member/register_result.jsp";
			break;
		case "login":
			login(req, resp);
			break;
		case "logout":
			logout(req, resp);
			break;
		case "forgitId":
			forgitId(req, resp);
			break;
		case "forgitPwd":
			forgitPwd(req, resp);
			break;
			
		}
		
		req.setAttribute("content", content);
		req.setAttribute("msg", msg);
		RequestDispatcher disp = req.getRequestDispatcher(index + content);
		disp.forward(req, resp);
	  
	}
	
	public void register(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}
	
	public void registerR(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Cud_vo v = setVo(req);
		
		if (dao.insert(v)) { msg = "가입이 완료되었습니다."; return; }
		else { msg = "회원 가입이 정상적으로 완료되지 않았습니다."; return; }
		
	}
	
	
	//로그인 데이터가 올라왔을 때 처리
	public void login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("qqqqqqqqqqqqqqqq");
		Cud_dao cud_dao = new Cud_dao();
		
		HttpSession session = req.getSession();
		String id = req.getParameter("cud_id").trim();
		String pwd = req.getParameter("cud_pwd").trim();

		System.out.println("id =" + id);
		System.out.println("pwd =" + pwd);
		
//		DAO의 login메소드로 사용자가 입력한 로그인 정보 인자로 보내고 결과를 vo에 담음
		Cud_vo vo = cud_dao.login(id, pwd);
		
//		id와 pwd의 정보를 db 쿼리문으로 체킹하여 vo에 값을 넣었는데 vo에 값이 들어있지 않다면 쿼리결과가 없다는 뜻이므로 로그인 실패, 결과 값이 있을 시 세션add
		if (vo.getCud_id() != null && vo.getCud_id() != "") {
			System.out.println("true = " + vo.getCud_id());
			session.setAttribute("vo", vo);
			
			// login.jsp 이전 페이지 url을 받아와서 다시 돌아가기
			String refer = req.getParameter("referrer");
			String urla = refer.substring(refer.indexOf("semi/") + 5);
			if(refer!=null) { index = urla; }
		
		} else {
			System.out.println("else = " + vo.getCud_id());
			msg = "아이디 또는 암호가 잘못 되었습니다";
			content = "member/login.jsp";
			
		}
		
	}
	
//	로그아웃이 작동하였을 시 모든 세션을 지워버림
	private void logout(HttpServletRequest req, HttpServletResponse resp) {
		
		HttpSession session = req.getSession();
		session.invalidate();
		index = "index.jsp";
		content = "";

	}
	
//	아이디를를 잃어버렸을 때
	public void forgitId(HttpServletRequest req, HttpServletResponse resp) {
		Cud_dao dao = new Cud_dao();
		
		String cud_name  = req.getParameter("cud_name"),
			   cud_phone = req.getParameter("cud_phone");
		
		System.out.println("cud_name = " + cud_name);
		System.out.println("cud_phone = " + cud_phone);
		
		String forgitId = dao.forgitId(cud_name, cud_phone);
		req.setAttribute("forgitId", forgitId);
		
		index 	= "indexHead.jsp?content=";
		content = "member/idForgit.jsp"; 
		
	}

//	비밀번호를 잃어버렸을 때
	public void forgitPwd(HttpServletRequest req, HttpServletResponse resp) {
		String cud_id	  = req.getParameter("cud_id"),
			   cud_pwdchk = req.getParameter("cud_pwdchk"),
			   cud_pwdans = req.getParameter("cud_pwdans");
		
		System.out.println("cud_id = " + cud_id);
		System.out.println("cud_pwdchk = " + cud_pwdchk);
		System.out.println("cud_pwdans = " + cud_pwdans);
		
		String forgitPwd = dao.forgitPwd(cud_id, cud_pwdchk, cud_pwdans);
		req.setAttribute("forgitPwd", forgitPwd);
		
		index 	= "indexHead.jsp?content=";
		content = "member/pwdForgit.jsp";
		
	}
	
//	공용 setVo
	public Cud_vo setVo(HttpServletRequest req) {
		Cud_vo v = new Cud_vo();
		
		v.setCud_id(req.getParameter("cud_id"));
		v.setCud_name(req.getParameter("cud_name"));
		v.setCud_pwd(req.getParameter("cud_pwd"));
		v.setCud_pwdchk(req.getParameter("cud_pwdchk"));
		v.setCud_pwdans(req.getParameter("cud_pwdans"));
		v.setCud_phone(req.getParameter("cud_phone"));
		
		
		return v;
	}
}
