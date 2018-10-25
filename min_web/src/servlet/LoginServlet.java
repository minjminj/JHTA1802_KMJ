package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.MemberDao;
import bean.MemberVo;

public class LoginServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		
		String id  = req.getParameter("mid");
		String pwd = req.getParameter("pwd");
		
		String nav = req.getParameter("nav");
		String sec = req.getParameter("oldsec");
		
		MemberDao dao = new MemberDao();
		MemberVo vo = dao.login(id);
		HttpSession sess = req.getSession();
		
		RequestDispatcher rd = null;
		/* 만약 로그인 성공시와 실패시 띄워줄 화면이 다르다면 RequestDispatcher를 각각 조건문 안에서 지정해주면 된다 */
		
		if (id != null || id != "" || pwd != null || pwd != ""){ 
			if (vo != null){
						if (pwd.equals(vo.getPwd())){
							sess.setAttribute("MEMBERID", id);
							req.setAttribute("id", id);
							req.setAttribute("pwd", pwd);
//							req.setAttribute("msg", "Login Success");
							rd = req.getRequestDispatcher("index.jsp?nav=" + nav + "&sec=" + sec);
						
						} else{
							req.setAttribute("msg", "Check your password");
							rd = req.getRequestDispatcher("index.jsp?sec=login.jsp");
						}
			} else {
				req.setAttribute("msg", "Check your ID and password");
				rd = req.getRequestDispatcher("index.jsp?sec=login.jsp");
			}
		}
		rd.forward(req, resp);
	}
}
