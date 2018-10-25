package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet{
	
	String name;
	
	/* 모두 서블릿에서 많이 쓰이는 메소드들! 하지만 doPost가 가장 많이 쓰임!! */
	@Override
	public void init() { /* 서블릿의 초기화 역할  (자동호출) */
		name = "kim";
	}
	
	/* 무조건 호출!
	 service()가 재정의 되면 doGet(), doPost()는 자동으로 호출되지 않음. - 그냥 service()만(get이건 post이건 상관 無 ) 실행.
	 service()가 재정의 되어 있지 않으면, get or post 어떤 방식이건 각자 맞는 do메소드 실행됨.
	 */
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		/* 한글 깨짐 방지 */
		resp.setContentType("text/html;charset=utf-8");
		req.setCharacterEncoding("utf-8"); /* 폼 한글 깨짐 방지 */
		
		/* 서블릿을 사용하여 웹 화면에 출력 */
		PrintWriter out = resp.getWriter();		/* 응답 정보를 가지고 있는 객체의 getWriter를 호출해서 out을 생성하면 jsp의 out.print의 out과 같은 방법으로 쓰일수 있다 */
		out.print("<font color='blue' size='5'>" + name + "</font>");
		out.close();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
}
