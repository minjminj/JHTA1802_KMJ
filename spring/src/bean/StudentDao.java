package bean;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

// DAO에 관한 interface를 만들기......ㅜㅜ
public class StudentDao {

	SqlSession sqlSession;
	
	// 사진 업로드(multipartRequest)를 위한 변수
		String uploadDir = "C:/new_workspace/spring/WebContent/upload/";
		String encType = "utf-8";
		int fileSize = 1024*1024*10; // 10Mb (1024*1024가 1메가)
	
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
		
	public StudentDao() {
		sqlSession = StudentFactory.getFatory().openSession();
	}
	
	// 리스트 보기 페이지에서 페이징 처리
	public int pageCompute(String findStr) {
		this.totSize = sqlSession.selectOne("student.list_count", findStr);
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
		
		return totSize;
	}
	
	public List<StudentVo> select(String findStr){
		pageCompute(findStr);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("findStr", findStr);
		map.put("startNo", startNo);
		map.put("endNo", endNo);
		
		List<StudentVo> list = sqlSession.selectList("student.list", map);
		
		return list;
	}
	
	
	public String insert(HttpServletRequest req) {
		String msg = "성공";
		
		try {
			MultipartRequest multi = new MultipartRequest(req, uploadDir, fileSize, encType, new DefaultFileRenamePolicy());
			StudentVo vo = setVo(multi);
			
			int cnt = sqlSession.insert("student.insert", vo);
			if (cnt > 0) {
				msg = "성공";
				sqlSession.commit();
			} else {
				msg = "실패";
				sqlSession.rollback();
			}
		} catch (IOException e) {
			e.printStackTrace();
			msg = "예외";
		} finally {
			return msg;
		}
	}
	
	public StudentVo view(String id) {
		StudentVo vo = sqlSession.selectOne("student.view", id);
		
		return vo;
	}

	public String update(HttpServletRequest req) {
		String msg = "수정 성공";
		
		MultipartRequest multi;
		try {
			multi = new MultipartRequest(req, uploadDir, fileSize, encType, new DefaultFileRenamePolicy());
			StudentVo vo = setVo(multi);
			
			int cnt = sqlSession.update("student.update", vo);
			if (cnt > 0) {
				sqlSession.commit();
			} else {
				msg = "수정 실패";
				sqlSession.rollback();
			}
			
		} catch (IOException e) {
			e.printStackTrace();
			msg = "수정 예외";
		}
		return msg;
	}
	
	public String delete(HttpServletRequest req) {
		String msg = "삭제 성공~";
		StudentVo vo = setVo(req);
		
		int cnt = sqlSession.delete("student.delete", vo.getId());
		
		if (cnt > 0) {
			String fileUrl = uploadDir + vo.getPhoto();
			File file = new File(fileUrl);
			if(file.exists()) file.delete();
			sqlSession.commit();
		} else {
			msg = "삭제 실패";
			sqlSession.rollback();
		}
		
		return msg;
	}

	public boolean login(String id, String pwd) {
		boolean b = true;
		
		StudentVo vo = new StudentVo();
		vo.setId(id);
		vo.setPwd(pwd);
		
		int cnt = sqlSession.selectOne("student.login", vo);
		
		if (cnt > 0) {
			
		} else {
			b = false;
		}
		
		return b;
	}
	
	public StudentVo find(String id, String phone) {
			
		StudentVo vo = new StudentVo();
		vo.setId(id);
		vo.setPhone(phone);
		
		vo= sqlSession.selectOne("student.find", vo);
		
		
		return vo;
	}
	
	public void mail(StudentVo vo, HttpServletRequest req) {
		
		// 메일과 관련된 변수
		String sender = "adiiiii@naver.com";
		String receiver = vo.getEmail();
		String subject = "회원정보 발송";
		String content = "회원님의 아이디: " + vo.getId() 
						+ "<br/>"
						+ "회원님의 비밀번호: " + vo.getPwd(); 
		
		try{
			
			// 메일 전송을 위한 로직
			String mailServer = "smtp.naver.com";
			
			Properties prop = new Properties(); // key = value 로 만드는 기능! 단, 둘 다 문자열 타입.
			prop.put("mail.smtp.starttls.enable", "true"); // 메일 전송서버 활성화
			prop.put("mail.transport.protocol", "smtp"); // 메일 전송시 사용되는 프로토콜
			prop.put("mail.smtp.port", "465" );
			prop.put("mail.smtp.auth", "true");
			prop.put("mail.smtp.user", receiver);
			prop.put("mail.smtp.host", mailServer);
			prop.put("mail.smtp.ssl.enable", "true"); // ssl 보안연결 활성화
			
			// 기본 메시지 설정
			Session mailSession = Session.getInstance(prop, new MyAuthenticator());
			Message message = new MimeMessage(mailSession);
			message.setFrom(new InternetAddress(sender));
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(receiver));
			message.setSubject(subject);
			message.setSentDate(new Date());
			
			// 문자열과 이미지를 동시에 전송
			Multipart part = new MimeMultipart();
			MimeBodyPart text = new MimeBodyPart();
			text.setContent(content, "text/html;charset=utf-8");
			part.addBodyPart(text);
			
			
			message.setContent(part);
			Transport.send(message);
			
			
		} catch (Exception ex){
			ex.printStackTrace();
		} 
	}
	
	public StudentVo setVo(MultipartRequest multi) {
		StudentVo vo = new StudentVo();
		vo.setId(multi.getParameter("id"));
		vo.setName(multi.getParameter("name"));
		vo.setPhone(multi.getParameter("phone"));
		vo.setPwd(multi.getParameter("pwd"));
		vo.setPost(multi.getParameter("post"));
		vo.setAddress(multi.getParameter("address"));
		vo.setEmail(multi.getParameter("email"));
		Enumeration tags = multi.getFileNames();
		while (tags.hasMoreElements()){
			String tag = (String)tags.nextElement();
			String photoOri = multi.getOriginalFileName(tag);
			String photo = multi.getFilesystemName(tag);
			vo.setPhoto(photo);
			vo.setPhotoOri(photoOri);
		}
		return vo;
	}
	
	public StudentVo setVo(HttpServletRequest req) {
		StudentVo vo = new StudentVo();
		vo.setId(req.getParameter("id"));
		vo.setPhoto(req.getParameter("photo"));
		return vo;
	}
	
}
