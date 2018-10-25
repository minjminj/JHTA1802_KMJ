package servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import bean.BoardDao;
import bean.BoardVo;


public class BoardServlet extends HttpServlet {
	
	BoardDao dao = new BoardDao();
	String nav = "../board/control.jsp";

	// 이전 페이지 값을 가지고 넘어가기 위한 변수
	String findStr = "";
	int nowPage = 1;
	
	String msg = "";
	
	// 사진 추가를 위한 변수
	String uploadDir = "C:/new_workspace/min_web/WebContent/upload/";
	String encType = "utf-8";
	int fileSize = 1024*1024*10; // 10Mb (1024*1024가 1메가)
	
	int serial;

	@Override
	public void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("text/html);charset=utf-8");
		
		String jobs = req.getRequestURI();
//		String temp = req.getServletPath();    switch 사용을위해서 !!
//		String url = temp.substring(1, temp.indexOf("."));
		
		if (jobs.indexOf("list.do") >= 0) {
			list(req, resp);
		} else if (jobs.indexOf("register.do") >= 0) {
			register(req, resp);
		} else if (jobs.indexOf("registerR.do") >= 0) {
			registerR(req, resp);
		} else if (jobs.indexOf("view.do") >= 0) {
			view(req, resp);
		} 
		else if (jobs.indexOf("modifyR.do") >= 0) {
//			modify(req, resp);
//		} 
//		else if (jobs.indexOf("modifyR.do") >= 0) {
			modifyR(req, resp);
		} 
		else if (jobs.indexOf("deleteR.do") >= 0) {
			deleteR(req, resp);
		} 
		else if (jobs.indexOf("rep.do") >= 0) {
			rep(req, resp);
		} 
		else if (jobs.indexOf("repR.do") >= 0) {
			repR(req, resp);
		} 
	}	
	
	public void list(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				
		if (req.getParameter("nowPage") != null){
			nowPage = Integer.parseInt(req.getParameter("nowPage"));
		}
		if (req.getParameter("findStr") != null){
			findStr = req.getParameter("findStr");
		}
		
		dao.setNowPage(nowPage);
		req.setAttribute("d", dao);
		
		List<BoardVo> list = dao.select(findStr);
		
		req.setAttribute("findStr", findStr);
		req.setAttribute("vo", list);
		
		
		
		RequestDispatcher rd = req.getRequestDispatcher("index.jsp?nav=" + nav
				+ "&sec=../board/list.jsp");
		rd.forward(req, resp);
	}
	
	public void register(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher("index.jsp?nav=" + nav 
				+ "&sec=../board/register.jsp");
		rd.forward(req, resp);
	}
	
	public void registerR(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if (req.getParameter("nowPage") != null){
			nowPage = Integer.parseInt(req.getParameter("nowPage"));
		}
		if (req.getParameter("findStr") != null){
			findStr = req.getParameter("findStr");
		}	
		
		// 사진 업로드하기
		MultipartRequest multi = new MultipartRequest(
				req, uploadDir, fileSize, encType, new DefaultFileRenamePolicy() );	
	
		BoardVo v = new BoardVo();
		v = setVo(multi);
	
		Enumeration tags = multi.getFileNames();
		while (tags.hasMoreElements()){
			String tag = (String)tags.nextElement();
			String fileOri = multi.getOriginalFileName(tag);
			String attFile = multi.getFilesystemName(tag);
			v.setFileOri(fileOri);
			v.setAttFile(attFile);
		}
		
		if (dao.insert(v)) { msg = "정상적으로 데이터가 저장됨.";} 
		else { msg = "!데이터 저장 중 오류 발생!";}
		
		req.setAttribute("msg", msg);
		req.setAttribute("v", v);
		
		req.setAttribute("nowPage", nowPage);
		req.setAttribute("findStr", findStr);
		
		RequestDispatcher rd = req.getRequestDispatcher("index.jsp?nav=" + nav 
				+ "&sec=../board/register_result.jsp");
		rd.forward(req, resp);
	}

	public void view(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int serial = 1;
		
		
		if (req.getParameter("serial") != null) {
			serial = Integer.parseInt(req.getParameter("serial"));
		}
		
		BoardVo v = dao.selectOne(serial);
		
		req.setAttribute("vo", v);
		RequestDispatcher rd = req.getRequestDispatcher("index.jsp?nav=" + nav 
				+ "&sec=../board/view.jsp");
		rd.forward(req, resp);
	}
//
//	public void modify(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		String pwd = req.getParameter("pwd");
//		
//		if ()
//		
//		RequestDispatcher rd = req.getRequestDispatcher("index.jsp?nav=" + nav 
//				+ "&sec=../board/modify.jsp");
//		rd.forward(req, resp);
//	}
	
	public void modifyR(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				
		MultipartRequest multi = new MultipartRequest(
				req, uploadDir, fileSize, encType, new DefaultFileRenamePolicy() );	
		
		if (multi.getParameter("nowPage") != null){
			nowPage = Integer.parseInt(multi.getParameter("nowPage"));
		}
		if (multi.getParameter("findStr") != null){
			findStr = multi.getParameter("findStr");
		}
		if (multi.getParameter("serial") != null){
			serial = Integer.parseInt(multi.getParameter("serial"));
		}
		
		BoardVo vo = dao.selectOne(serial);
		
		BoardVo v = setVo(multi);
		v.setSerial(serial);
	
		if (vo.getAttFile() != null && vo.getFileOri() != null) {
			v.setAttFile(vo.getAttFile());
			v.setFileOri(vo.getFileOri());
		} else {
			Enumeration tags = multi.getFileNames();
			while (tags.hasMoreElements()){
				String tag = (String)tags.nextElement();
				String fileOri = multi.getOriginalFileName(tag);
				String attFile = multi.getFilesystemName(tag);
				v.setFileOri(fileOri);
				v.setAttFile(attFile);
			}
		}
		
		
		if (dao.modify(v)) {msg = "수!정!완!료!";}
		else {msg = "수ㅠ저유시류패ㅠ";}
		
		req.setAttribute("findStr", findStr);
		req.setAttribute("nowPage", nowPage);
		req.setAttribute("msg", msg);
		
		RequestDispatcher rd = req.getRequestDispatcher("index.jsp?nav=" + nav 
				+ "&sec=../board/modify_result.jsp");
		rd.forward(req, resp);
	}
	
	public void deleteR(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String findStr = "";
		int nowPage = 1;
		if (req.getParameter("nowPage") != null){
			nowPage = Integer.parseInt(req.getParameter("nowPage"));
		}
		if (req.getParameter("findStr") != null){
			findStr = req.getParameter("findStr");
		}
		
		req.setAttribute("findStr", findStr);
		req.setAttribute("nowPage", nowPage);
		
		RequestDispatcher rd = req.getRequestDispatcher("index.jsp?nav=" + nav 
				+ "&sec=../board/delete_result.jsp");
		rd.forward(req, resp);
	}
	
	public void rep(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher("index.jsp?nav=" + nav 
				+ "&sec=../board/rep.jsp");
		rd.forward(req, resp);
	}
	
	public void repR(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher("index.jsp?nav=" + nav 
				+ "&sec=../board/rep_result.jsp");
		rd.forward(req, resp);
	}
	
	public BoardVo setVo(MultipartRequest multi) {
		BoardVo v = new BoardVo();
		v.setId(multi.getParameter("id"));
		v.setSubject(multi.getParameter("subject"));
		v.setDoc(multi.getParameter("doc"));
		v.setAttFile(multi.getParameter("attFile"));
		v.setFileOri(multi.getParameter("fileOri"));
		v.setPwd(multi.getParameter("pwd"));
		
		return v;
	}
	
	public BoardVo setVo(ResultSet rs) {
		BoardVo v = new BoardVo();
		try {
			v.setSerial(rs.getInt("serial"));
			v.setMdate(rs.getDate("mdate").toString());
			v.setId(rs.getString("id"));
			v.setSubject(rs.getString("subject"));
			v.setDoc(rs.getString("doc"));
			v.setHit(rs.getInt("hit"));
			v.setGrp(rs.getInt("grp"));
			v.setDeep(rs.getString("deep"));
			v.setAttFile(rs.getString("attfile"));
			v.setFileOri(rs.getString("fileori"));
			v.setPwd(rs.getString("password"));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return v;
	}

}
