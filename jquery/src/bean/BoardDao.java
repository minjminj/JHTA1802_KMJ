package bean;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardDao {
	Connection conn;
	StringBuilder sb;
	String findStr = "";
	String message = "";
	


	// 사진 업로드(multipartRequest)를 위한 변수
	String uploadDir = "C:/new_workspace/jquery/WebContent/upload/";
	String encType = "utf-8";
	int fileSize = 1024*1024*10; // 10Mb (1024*1024가 1메가)
	
	// pageCompute를 위한 변수
	int listSize = 7;
	int blockSize = 3;
	int nowPage = 1;	// getter/setter 만들어야함 (외부에서 사용해야하기 때문에)
	
	int totSize = 0;
	int totPage =0;		// getter만
	int totBlock = 0;
	int nowBlock = 0;
	
	int endPage = 0;	// getter만
	int startPage = 0;	// getter만
	
	int endNo = 0;		//getter만
	int startNo = 0;	//getter만

	public BoardDao() {
		conn = new DBConnection().getConn();
		sb = new StringBuilder();
		
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

	public int getTotBlock() {
		return totBlock;
	}

	public int getNowBlock() {
		return nowBlock;
	}
	public String getFindStr() {
		return findStr;
	}
	
	public void setFindStr(String findStr) {
		this.findStr = findStr;
	}
	
	public String getMessage() {
		return message;
	}
	
	public void setMessage(String message) {
		this.message = message;
	}
	
	public void pageCompute(String findStr) {
		String sql = "select count(serial) cnt from board  where "
				+ " id like ? "
				+ " or subject like ? "
				+ " or doc like ? ";
		
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + findStr + "%");
			ps.setString(2, "%" + findStr + "%");
			ps.setString(3, "%" + findStr + "%");
			
			ResultSet rs = ps.executeQuery();
			rs.next();
			
			totSize = rs.getInt("cnt");
			
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
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
	}
// 그냥 Dao에서 갖다 붙이 insert	
	public boolean insert(BoardVo vo) {
		boolean b = true;
		String sql = "insert into board values(seq_board.nextval, sysdate, ?, ?, ?, 0, seq_board.currval, seq_board.currval, ?, ?, ?)";
		
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getId());
			ps.setString(2, vo.getSubject());
			ps.setString(3, vo.getDoc());
			ps.setString(4, vo.getAttFile());
			ps.setString(5, vo.getFileOri());
			ps.setString(6, vo.getPwd());
			
			
			int cnt = ps.executeUpdate(); //insert, update, delete 모두 실행할때 사용.
			if (cnt <= 0) b=false;
		} catch(Exception ex) {
			ex.printStackTrace();
			b = false;
		} finally {
		
			return b;
		}
	}
// Dao와 Servlet의 내용을 조합하여 String을 리턴하는 형태로(boolean타입이면 jsp에서 분기타서 msg 출력부분 코드가 있어야하니까. view와 ui분리 nono) 작성한 insert	
	public String insert(HttpServletRequest req) {
		this.message = "";
		
		try {
			MultipartRequest multi = fileUpload(req);
			BoardVo vo = setVo(multi);
			
			this.nowPage = Integer.parseInt(multi.getParameter("nowPage"));
			this.findStr = multi.getParameter("findStr");
			
			String sql = "insert into board values(seq_board.nextval, sysdate, ?, ?, ?, 0, seq_board.currval, seq_board.currval, ?, ?, ?)";
			
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, vo.getId());
				ps.setString(2, vo.getSubject());
				ps.setString(3, vo.getDoc());
				ps.setString(4, vo.getAttFile());
				ps.setString(5, vo.getFileOri());
				ps.setString(6, vo.getPwd());
				
				int cnt = ps.executeUpdate();
				if (cnt >0 ) {
					this.message = "게시글 등록됨";
				} else {
					this.message= "저장실패";
				}
				
				System.out.println(message);
		} catch (Exception e) {
			message = "등록 중 오류발생" + e.toString();
		} finally {
			return this.message;
		}
		//req.setAttribute("msg", message);
	}
	
	public List<BoardVo> select(String findStr){
		pageCompute(findStr);
		
		List<BoardVo> list = new ArrayList<>();
		String sql = "select * from "
				+ "	(	select rownum num, r.* from "
				+ "	 	( 	select * from board where "
								+ " id like ? "
								+ " or subject like ? "
								+ " or doc like ? order by grp desc , deep"
				+ "		)r"
				+ "  ) where num between ? and ? ";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + findStr + "%");
			ps.setString(2, "%" + findStr + "%");
			ps.setString(3, "%" + findStr + "%");
			ps.setInt(4, startNo);
			ps.setInt(5, endNo);
			
			 
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				BoardVo v = new BoardVo();
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
				
				list.add(v);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			list = null;
		} finally {
			return list;
		}
	}
	
	public BoardVo selectOne(int serial) {
		BoardVo v = null;
		
		String sql = "select * from board where serial = ?";
		
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, serial);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				v = new BoardVo();
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
				
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			v = null;
		} finally {
			return v;
		}
	}
	
	public boolean modify(BoardVo vo) {
		boolean b = true;
		
		String sql = "update board set "
				   + " subject = ? , "
				   + " doc = ? , "
				   + " attfile = ? , "
				   + " fileori = ? "
				   + " where serial = ? and password = ?";

		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getSubject());
			ps.setString(2, vo.getDoc());
			ps.setString(3, vo.getAttFile());
			ps.setString(4, vo.getFileOri());
			ps.setInt(5, vo.getSerial());
			ps.setString(6, vo.getPwd());
			
			int cnt = ps.executeUpdate(); //insert, update, delete 모두 실행할때 사용.
			if (cnt <= 0) b=false;
			
		} catch (Exception ex) {
			ex.printStackTrace();
			b = false;
		} finally {
			return b;
		}
		
	}
	
	public String delete(HttpServletRequest req) {
		this.message = "";
		
		BoardVo vo = setVo(req);
		
		String fileUrl = uploadDir + vo.getAttFile();
		
		this.nowPage = Integer.parseInt(req.getParameter("nowPage"));
		this.findStr = req.getParameter("findStr");
		File file = new File(fileUrl);
		
		
		String sql = "delete from board where serial = ? and password = ?";
			
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, req.getParameter("serial"));
			ps.setString(2, vo.getPwd());
			
			int cnt = ps.executeUpdate();
			if (cnt > 0) {
				if (file.exists()) {
					file.delete();
				}
				this.message = "수정 성공";
			} else {
				this.message = "수정 실패";
			}
			
		} catch (Exception ex) {
			ex.printStackTrace();
			this.message = "수정 중 예외발생";
		} finally {
			return this.message;
		}
	}
	
	public String rep(HttpServletRequest req) {
			this.message = "";
			
			try {
				MultipartRequest multi = fileUpload(req);
				BoardVo vo = setVo(multi);
				
				this.nowPage = Integer.parseInt(multi.getParameter("nowPage"));
				this.findStr = multi.getParameter("findStr");
				
				String sql = "insert into board values(seq_board.nextval, sysdate, ?, ?, ?, 0, ?, ?|| '-' ||seq_board.currval, ?, ?, ?)";
				
					PreparedStatement ps = conn.prepareStatement(sql);
					ps.setString(1, vo.getId());
					ps.setString(2, "Re:" + vo.getSubject());
					ps.setString(3, vo.getDoc());
					ps.setString(4, multi.getParameter("serialParent"));
					ps.setString(5, multi.getParameter("serialParent"));
					ps.setString(6, vo.getAttFile());
					ps.setString(7, vo.getFileOri());
					ps.setString(8, vo.getPwd());
					
					int cnt = ps.executeUpdate();
					if (cnt >0 ) {
						this.message = "답글이 등록됨";
					} else {
						this.message= "답글 저장 실패";
					}
					
					System.out.println(message);
			} catch (Exception e) {
				message = "답글 등록 중 오류발생" + e.toString();
			} finally {
				return this.message;
			}
			//req.setAttribute("msg", message);
	}
	
	// insert 와 modify에서 필요한 BoardVo 형태를 저장
	public BoardVo setVo(MultipartRequest multi) {
		BoardVo v = new BoardVo();
		v.setId(multi.getParameter("id"));
		v.setSubject(multi.getParameter("subject"));
		v.setDoc(multi.getParameter("doc"));
		v.setPwd(multi.getParameter("pwd"));
		this.findStr = multi.getParameter("findStr");	
		
		Enumeration tags = multi.getFileNames();
		while (tags.hasMoreElements()){
			String tag = (String)tags.nextElement();
			String fileOri = multi.getOriginalFileName(tag);
			String attFile = multi.getFilesystemName(tag);
			
			v.setFileOri(fileOri);
			v.setAttFile(attFile);
		}
		return v;
	}
	
	// multiform이 필요하지 않은 delete를 위해 BoardVo를 저장
	public BoardVo setVo(HttpServletRequest req) {
		BoardVo v = new BoardVo();
		v.setId(req.getParameter("id"));
		v.setSubject(req.getParameter("subject"));
		v.setDoc(req.getParameter("doc"));
		v.setPwd(req.getParameter("pwd"));
		v.setFileOri(req.getParameter("fileOri"));
		v.setAttFile(req.getParameter("attFile"));
		this.findStr = req.getParameter("findStr");	
		
		return v;
	}
	
	// insert, modify 등에서 사진 저장시 소스 중복을 줄이기 위해 사진 업로드 기능만을 담고 있는 fileUpload생성
	public MultipartRequest fileUpload(HttpServletRequest req) {
		MultipartRequest multi = null;
		try {
			multi = new MultipartRequest(req, uploadDir, fileSize, encType, new DefaultFileRenamePolicy());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return multi;
	}
}

