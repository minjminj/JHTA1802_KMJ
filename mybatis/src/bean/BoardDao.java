package bean;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardDao {
	
	// DB연결을 위한 변수
	SqlSession s;
	
	// 사진 업로드를 위한 변수
	String uploadDir = "C:/new_workspace/mybatis/WebContent/upload/";
	int size = 104*1024*50;
	String ecode = "utf-8";
	
	// pageCompute를 위한 변수
	int listSize = 5;
	int blockSize = 3;
	int nowPage = 1;	// getter/setter 만들어야함 (외부에서 사용해야하기 때문에)
	
	int totSize = 0;
	int totPage =0;		// getter만
	int totBlock = 0;	// getter만
	int nowBlock = 0;	// getter만
	
	int endPage = 0;	// getter만
	int startPage = 0;	// getter만
	
	int endNo = 0;		//getter만
	int startNo = 0;	//getter만
		
	// parameter 처리 변수
	String findStr = "";
	String msg = "";
	int serial = 0;
	

		
		
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getTotPage() {	
		return totPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public int getStartPage() {
		return startPage;
	}
	public int getEndNo() {
		return endNo;
	}
	public int getStartNo() {
		return startNo;
	}
	public int getNowBlock() {
		return nowBlock;
	}
	public int getTotBlock() {
		return totBlock;
	}
	public int getTotSize() {
		return totSize;
	}
	public String getFindStr() {
		return findStr;
	}
	public void setFindStr(String findStr) {
		this.findStr = findStr;
	}
	public int getSerial() {
		return serial;
	}
	public void setSerial(int serial) {
		this.serial = serial;
	}
	
	
	
	public BoardDao() {
		s = BeginFactory.getFatory().openSession();
	}
	
	// 게시판 입력
	public String insert(HttpServletRequest req) {
		msg = "정상적으로 저장되었습니다";
		try {
			MultipartRequest multi = new MultipartRequest(req, uploadDir, size, ecode, new DefaultFileRenamePolicy());
			BoardVo vo = setVo(multi);
			int cnt = s.insert("board.insert", vo);
			if(cnt > 0) {
				s.commit();
			} else {
				msg = "<span class='err'> 저장 중 오류 발생 </span>";
			}
		} catch (Exception e) {
			msg = "<span class='err'> 저장 중 예외 처리됨 </span>";
			e.printStackTrace();
		} finally {
			s.close();
			return msg;
		}
	}
	
	// 리스트 보기 페이지에서 페이징 처리
	public int pageCompute(String findStr) {
		this.totSize = s.selectOne("board.list_count", findStr);
		System.out.println(totSize);
		totPage = (int)Math.ceil(totSize/(double)listSize);
		totBlock = (int)Math.ceil(totPage/(double)blockSize);
		nowBlock = (int)Math.ceil(nowPage/(double)blockSize);
		
		endPage = nowBlock * blockSize;
		startPage = endPage - blockSize + 1;
		if (endPage > totPage) endPage = totPage;
		if (startPage < 1) startPage = 1;
		
		endNo = nowPage * listSize;
		startNo = endNo - listSize + 1;
		if (endNo > totSize) endNo = totSize;
		if (startNo < 1) startNo = 1;	
		
		System.out.println("end: " + endNo);
		System.out.println("start: " + startNo);
		return totSize;
	}
	
	// 게시판 목록 보기
	public List<BoardVo> select(String findStr){
		pageCompute(findStr);
		
		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("findStr", findStr);
		parameters.put("startNo", startNo);
		parameters.put("endNo", endNo);
		
		List<BoardVo> list = s.selectList("board.list", parameters);
		s.close();
		return list;
		
	}
	
	// 게시글 상세보기
	public BoardVo view(int serial) {
		BoardVo vo = s.selectOne("board.view", serial);
		
		return vo;
	}
	
	// 게시글 수정
	public String update(HttpServletRequest req) {
		msg = "수정이 정상적으로 뿅";
			
		MultipartRequest multi;
		try {
			multi = new MultipartRequest(req, uploadDir, size, ecode, new DefaultFileRenamePolicy());
			BoardVo vo = setVo(multi);
			
			this.nowPage = Integer.parseInt(multi.getParameter("np"));
			this.findStr = multi.getParameter("findStr");
			this.serial = Integer.parseInt(multi.getParameter("sl"));
			
			Map<String, Object> parameters = new HashMap<String, Object>();
			parameters.put("subject",  vo.getSubject());
			parameters.put("doc",      vo.getDoc());
			parameters.put("attfile",  vo.getAttfile());
			parameters.put("fileori",  vo.getFileOri());
			parameters.put("serial",   serial);
			parameters.put("password", vo.getPassword());
			
			int cnt = s.update("board.update", parameters);
			if(cnt > 0) {
				s.commit();
			} else {
				msg = "<span class='err'> 수정 결과 저장 중 오류 발생 </span>";
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msg = "<span class='err'> 수정 결과 처리 중 오류 발생 </span>";
		} finally {
			s.close();
			return msg;
		}
	}
	
	// 답글 입력
	public String insert_reply(HttpServletRequest req) {
		msg = "답글이 정상적으로 저장되었습니다";
		try {
			MultipartRequest multi = new MultipartRequest(req, uploadDir, size, ecode, new DefaultFileRenamePolicy());
			BoardVo vo = setVo(multi);
			int cnt = s.insert("board.insert_reply", vo);
			if(cnt > 0) {
				s.commit();
			} else {
				msg = "<span class='err'> 답글 저장 중 오류 발생 </span>";
			}
		} catch (Exception e) {
			msg = "<span class='err'> 답글 저장 중 예외 처리됨 </span>";
			e.printStackTrace();
		} finally {
			s.close();
			return msg;
		}
	}
	
	public String delete(HttpServletRequest req){
		this.msg = "정상적으로 삭제가 완료되었습니다.";
		this.serial = Integer.parseInt(req.getParameter("sl"));
				
		String path = uploadDir + req.getParameter("realfile");
		System.out.println(path);
		File file = new File(path);
		System.out.println(file.toString());
		

		int cnt = s.delete("board.delete", serial);
		if (cnt > 0){
			if(file.exists()){
				System.out.println("존재안해?");
				file.delete();
			}
			s.commit();
		}
		return msg;
	}
	
	
	public BoardVo setVo(MultipartRequest req) {
		BoardVo vo = new BoardVo();
		
		vo.setId(req.getParameter("id"));
		vo.setPassword(req.getParameter("pwd"));
		vo.setSubject(req.getParameter("subject"));
		vo.setDoc(req.getParameter("doc"));
		
		System.out.println("1"+vo.getId());
		System.out.println("1"+vo.getPassword());
		System.out.println("1"+vo.getSubject());
		System.out.println("1"+vo.getDoc());
		
		//답글
		if (req.getParameter("grp") != null){
			vo.setGrp(Integer.parseInt(req.getParameter("grp")));
			vo.setDeep(req.getParameter("deep"));
		}
		
		//첨부파일
		Enumeration e = req.getFileNames();
		while(e.hasMoreElements()) {
			String tag = (String)e.nextElement();
			String attfile = req.getFilesystemName(tag);
			String fileori = req.getOriginalFileName(tag);
			
			vo.setAttfile(attfile);
			vo.setFileOri(fileori);
		}
		
		
		return vo;
	}
	
}

