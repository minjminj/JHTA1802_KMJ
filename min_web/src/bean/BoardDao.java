package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BoardDao {
	Connection conn;
	
	int listSize = 6;
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
	
	
	
	public List<BoardVo> select(String findStr){
		pageCompute(findStr);
		List<BoardVo> list = new ArrayList<>();
		String sql = "select * from "
				+ "	(	select rownum num, r.* from "
				+ "	 	( 	select * from board where "
								+ " id like ? "
								+ " or subject like ? "
								+ " or doc like ? "
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
			System.out.println("3"+vo.getAttFile());
			ps.setString(4, vo.getFileOri());
			System.out.println("4"+vo.getFileOri());
			ps.setInt(5, vo.getSerial());
			System.out.println("5"+vo.getSerial());
			ps.setString(6, vo.getPwd());
			
			
			
			int cnt = ps.executeUpdate(); //insert, update, delete 모두 실행할때 사용.
			System.out.println(cnt);
			if (cnt <= 0) b=false;
			
		} catch (Exception ex) {
			ex.printStackTrace();
			b = false;
		} finally {
			return b;
		}
		
	}
	
	public boolean delete(BoardVo vo) {
		boolean b = true;
		String sql = "delete from student where id = ? and pwd = ?";
		
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getId());
			ps.setString(2, vo.getPwd());
			
			int cnt = ps.executeUpdate();
			if (cnt <= 0) b = false;
			
		} catch (Exception ex) {
			ex.printStackTrace();
			b = false;
		} finally {
		return b;
		}
	}
	
	public boolean rep(BoardVo vo) {
		boolean b = true;
		
		return b;
	}
}
