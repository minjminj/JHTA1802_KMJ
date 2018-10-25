package servlet;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.awt.image.renderable.ParameterBlock;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.List;

import javax.imageio.ImageIO;
import javax.media.jai.JAI;
import javax.media.jai.RenderedOp;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import bean.MemberDao;
import bean.MemberVo;
import jdk.nashorn.internal.ir.RuntimeNode.Request;

public class MemberServlet extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		 
		String jobs = req.getRequestURI();
		String nav = "../servlet_member/chap08_member_control.jsp";
		String sec = "";
		MemberDao dao = new MemberDao();
	
		if (jobs.indexOf("login.hta") >= 0) {
			
			
			
		} else if (jobs.indexOf("registerR.hta") >= 0) {
			// 사진 추가를 위한 변수
			String uploadDir = "C:/new_workspace/min_web/WebContent/upload/";
			String encType = "utf-8";
			int fileSize = 1024*1024*10; // 10Mb (1024*1024가 1메가)
			
			// 사진 업로드하기
			MultipartRequest multi = new MultipartRequest(
					req, uploadDir, fileSize, encType, 
					new DefaultFileRenamePolicy() );

			
			MemberVo v = setVo1(multi);
			String msg = "";	
			if (dao.insert(v)) { msg = "정상적으로 데이터가 저장됨.";} 
			else { msg = "!데이터 저장 중 오류 발생!";}
			
			req.setAttribute("msg", msg);
			req.setAttribute("m", v);
			RequestDispatcher rd = req.getRequestDispatcher("index.jsp?nav=" + nav
									+ "&sec=../servlet_member/chap08_member_register_result.jsp");
			rd.forward(req, resp);
		
		
		
		} else if (jobs.indexOf("list.hta") >= 0) {
			 	// jobs.indexOf("list")로만 해도 된다. 왜냐면 어차피 url에 list.hta는 같이 올라오니까 굳이
				// list.hta 를 다 찾을필요없이 list만 찾아도 list.hta가 들어온거니까!
			String findStr = "";
			int nowPage = 1;
			if (req.getParameter("nowPage") != null){
				nowPage = Integer.parseInt(req.getParameter("nowPage"));
			}
			if (req.getParameter("findStr") != null){
				findStr = req.getParameter("findStr");
			}
			
			dao.setNowPage(nowPage);
			req.setAttribute("d", dao);
			
			List<MemberVo> list = dao.select(findStr);
			
			req.setAttribute("findStr", findStr);
			req.setAttribute("nowPage", nowPage);
			req.setAttribute("vo", list);
			
			RequestDispatcher rd = req.getRequestDispatcher("index.jsp?nav=" + nav
					+ "&sec=../servlet_member/list.jsp");
			rd.forward(req, resp);
			
			
			
		} else if (jobs.indexOf("list1.hta") >= 0) {
			 	// jobs.indexOf("list")로만 해도 된다. 왜냐면 어차피 url에 list.hta는 같이 올라오니까 굳이
				// list.hta 를 다 찾을필요없이 list만 찾아도 list.hta가 들어온거니까!
			String findStr = "";
			int nowPage = 1;
			if (req.getParameter("nowPage") != null){
				nowPage = Integer.parseInt(req.getParameter("nowPage"));
			}
			if (req.getParameter("findStr") != null){
				findStr = req.getParameter("findStr");
			}
			
			dao.setNowPage(nowPage);
			req.setAttribute("d", dao);
			
			List<MemberVo> list = dao.select(findStr);
			
			req.setAttribute("findStr", findStr);
			req.setAttribute("nowPage", nowPage);
			req.setAttribute("vo", list);
			
			RequestDispatcher rd = req.getRequestDispatcher("index.jsp?nav=" + nav
					+ "&sec=list_with_photo.jsp");
			rd.forward(req, resp);
		
		
		
		} else if (jobs.indexOf("view.hta") >0 ) {
			String id = req.getParameter("id");
			MemberVo vo = dao.view(id);
			req.setAttribute("vo", vo);
			
			RequestDispatcher rd = req.getRequestDispatcher("index.jsp?nav=" + nav
					+ "&sec=../servlet_member/view.jsp");
			rd.forward(req, resp);
		
		
		
		} else if (jobs.indexOf("modify.hta") >= 0) {
			modify(req, resp);
			
		} else if (jobs.indexOf("delete.hta") >= 0) {
			delete(req, resp);
		}

	} // end of service
	
	public void modify(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		int nowPage = 1;
		MemberDao dao = new MemberDao();
		
		String uploadDir = "C:/new_workspace/min_web/WebContent/upload";
		String encType = "utf-8";
		int fileSize = 1024*1024*10; // 10Mb (1024*1024가 1메가)
		
		MultipartRequest multi = new MultipartRequest(
				req, uploadDir, fileSize, encType, 
				new DefaultFileRenamePolicy() );
		
		MemberVo v = setVoModify(multi);
		
	
		
		String msg = "";
		String nav = "../servlet_member/chap08_member_control.jsp";
		
		if (req.getParameter("nowPage") != null){
			nowPage = Integer.parseInt(req.getParameter("nowPage"));
		}
		
		if (dao.update(v)){				msg = "정상적으로 데이터가 수정됨.";} 
		else{ msg = "수정 중 오류 발생";}
		
		req.setAttribute("msg", msg);
		req.setAttribute("nowPage", nowPage);
		RequestDispatcher rd = req.getRequestDispatcher("index.jsp?nav=" + nav
				+ "&sec=../servlet_member/modify.jsp");
		rd.forward(req, resp);
	
	}
	
	public void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		int nowPage = 1;
		String msg = "";
		String nav = "../servlet_member/chap08_member_control.jsp";

		MemberDao dao = new MemberDao();

		if (req.getParameter("nowPage") != null){
			nowPage = Integer.parseInt(req.getParameter("nowPage"));
		}

		String uploadDir = "C:/new_workspace/min_web/WebContent/upload/";
		String encType = "utf-8";
		int fileSize = 1024*1024*10; // 10Mb (1024*1024가 1메가)
		
		MultipartRequest multi = new MultipartRequest(
				req, uploadDir, fileSize, encType, 
				new DefaultFileRenamePolicy() );
		
		File file1 = null;
		File file = null;
		
		MemberVo v = setVo(multi);
		
		if (v.getPhoto() != null || v.getPhoto() != "") {
			file1 = new File(uploadDir + v.getPhoto());	// 업로드된 사진 객체생성
			file = new File(uploadDir + "sm_" + v.getPhoto()); // 썸네일 파일을 생성할때
		}
		
		if (dao.delete(v)){
			msg = "정상적으로 데이터가 삭제됨.";
			if (file1.exists()) {
				file1.delete();
			} 
			if (file.exists()) {
				file.delete();
			}
		} 
		else{ msg = "삭제 중 오류 발생";}
		
		req.setAttribute("msg", msg);
		req.setAttribute("nowPage", nowPage);
		RequestDispatcher rd = req.getRequestDispatcher("index.jsp?nav=" + nav
				+ "&sec=../servlet_member/delete.jsp");
		rd.forward(req, resp);
	
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//method = "GET type";
		/*
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		
		PrintWriter out = resp.getWriter();
		out.print(method);
		
		/* 현재 요청 정보와 응답 정보를 특정 페이지에 전달/
		req.setAttribute("method", method);
		*/
	
		/* doPost(req, resp); */
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
	}
	// 일반 뷰
	public MemberVo setVo(HttpServletRequest req) {
		MemberVo v = new MemberVo();
		v.setId(req.getParameter("id"));
		v.setName(req.getParameter("name"));
		v.setAr(req.getParameter("ar"));
		v.setEmail(req.getParameter("email"));
		v.setPhone(req.getParameter("phone"));
		v.setPost(req.getParameter("post"));
		v.setPwd(req.getParameter("pwd"));
		v.setRdate(req.getParameter("rdate"));
		
		return v;
	}
	
	// 사진 업로드 -- 일반 뷰 메소드를 오버로딩
	public MemberVo setVo(MultipartRequest req) {
		MemberVo v = new MemberVo();
		v.setId(req.getParameter("id"));
		v.setName(req.getParameter("name"));
		v.setAr(req.getParameter("ar"));
		v.setEmail(req.getParameter("email"));
		v.setPhone(req.getParameter("phone"));
		v.setPost(req.getParameter("post"));
		v.setPwd(req.getParameter("pwd"));
		v.setRdate(req.getParameter("rdate"));
		
		// file 태그명과 원본파일명, 연결된 파일명의 정보
		Enumeration tags = req.getFileNames();
		while (tags.hasMoreElements()){
			String tag = (String)tags.nextElement();
			String fileName = req.getOriginalFileName(tag);
			String reName = req.getFilesystemName(tag);
			
			v.setPhoto(reName);
			v.setPhotO(fileName);
			
			
		}
		
		
		
		return v;
	}
	
	
	public MemberVo setVo1(MultipartRequest req) throws IOException {
		// 사진업로드를 위한 변수
		String uploadDir = "C:/new_workspace/min_web/WebContent/upload/";
		String encType = "utf-8";
		int fileSize = 1024*1024*10; // 10Mb (1024*1024가 1메가)
		
		// 썸네일 생성을 위한 변수		
		ParameterBlock pb = null;
		RenderedOp op = null;
		BufferedImage bi = null;
		BufferedImage thumb = null;
		Graphics2D g = null;
		File file = null;
		
		MemberVo v = new MemberVo();
		v.setId(req.getParameter("id"));
		v.setName(req.getParameter("name"));
		v.setAr(req.getParameter("ar"));
		v.setEmail(req.getParameter("email"));
		v.setPhone(req.getParameter("phone"));
		v.setPost(req.getParameter("post"));
		v.setPwd(req.getParameter("pwd"));
		v.setRdate(req.getParameter("rdate"));
		
		// file 태그명과 원본파일명, 연결된 파일명의 정보
		Enumeration tags = req.getFileNames();
		while (tags.hasMoreElements()){
			String tag = (String)tags.nextElement();
			String fileName = req.getOriginalFileName(tag);
			String reName = req.getFilesystemName(tag);
			
			v.setPhoto(reName);
			v.setPhotO(fileName);
		
			// 썸네일 생성
			pb = new ParameterBlock();
			pb.add(uploadDir + reName);
			op = JAI.create("fileload", pb);
			
			bi = op.getAsBufferedImage();
			thumb = new BufferedImage(70,70, BufferedImage.TYPE_INT_RGB);
			
			g = thumb.createGraphics();
			g.drawImage(bi, 0, 0, 70, 70, null);
		
			file = new File(uploadDir + "sm_" + reName);
	
			String ext = reName.substring(reName.indexOf(".")+1);
			ImageIO.write(thumb,ext,file);
			System.gc();
			
		}
		return v;
	}
	
	
	
	// 썸네일 생성을 포함하는 multpartRequest타입 매개변수를 갖는 setvo변형
	public MemberVo setVoModify(MultipartRequest req) throws IOException {
		// 사진업로드를 위한 변수
		String uploadDir = "C:/new_workspace/min_web/WebContent/upload/";
		String encType = "utf-8";
		int fileSize = 1024*1024*10; // 10Mb (1024*1024가 1메가)
		
		// 썸네일 생성을 위한 변수		
		ParameterBlock pb = null;
		RenderedOp op = null;
		BufferedImage bi = null;
		BufferedImage thumb = null;
		Graphics2D g = null;
		File file = null;
		File file1 = null;
		
		MemberVo v = new MemberVo();
		v.setId(req.getParameter("id"));
		v.setName(req.getParameter("name"));
		v.setAr(req.getParameter("ar"));
		v.setEmail(req.getParameter("email"));
		v.setPhone(req.getParameter("phone"));
		v.setPost(req.getParameter("post"));
		v.setPwd(req.getParameter("pwd"));
		v.setRdate(req.getParameter("rdate"));
		
		// file 태그명과 원본파일명, 연결된 파일명의 정보
		Enumeration tags = req.getFileNames();
		while (tags.hasMoreElements()){
			String tag = (String)tags.nextElement();
			String fileName = req.getOriginalFileName(tag);
			String reName = req.getFilesystemName(tag);
			
			v.setPhoto(reName);
			v.setPhotO(fileName);
			
			String aa = req.getParameter("aa");	// 변경 전 사진 파일의 이름
			String a1 = req.getParameter("a1"); // 변경 전 사진 (rename)파일의 이름
			String bb = v.getPhotO();				// 변경 후 사진 파일의 이름
			System.out.println("aa:" + aa);
			System.out.println("a1:" + a1);
			System.out.println("bb:" + bb);
		
			// 썸네일 생성
			pb = new ParameterBlock();
			pb.add(uploadDir + reName);
			op = JAI.create("fileload", pb);
			
			bi = op.getAsBufferedImage();
			thumb = new BufferedImage(70,70, BufferedImage.TYPE_INT_RGB);
			
			g = thumb.createGraphics();
			g.drawImage(bi, 0, 0, 70, 70, null);
			
			file1 = new File(uploadDir + a1);	// 업로드된 사진 객체생성
			file = new File(uploadDir + "sm_" + a1); // 썸네일 파일을 생성할때
			if (!(a1.equals(v.getPhoto()))) {
				// 기존 업로드 된 파일 삭
				file1.delete();
				// 기존 썸네일 삭제하고 재생성하기
				file.delete();
				file = new File(uploadDir + "sm_" + reName);
			}
	
			String ext = reName.substring(reName.indexOf(".")+1);
			ImageIO.write(thumb,ext,file);
			System.gc();
			
		}
		return v;
	}
	
}
