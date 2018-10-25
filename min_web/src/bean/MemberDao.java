package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MemberDao {
	Connection conn;
	
 
	int listSize = 3;
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
	
	public MemberDao() {
		conn = new DBConnection().getConn();
		
	}

	public void pageCompute(String findStr) {
		String sql = "select count(id) cnt from student  where "
				+ " id like ? "
				+ " or name like ? "
				+ " or phone like ? "
				+ " or address like ? "
				+ " or email like ? ";
		
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + findStr + "%");
			ps.setString(2, "%" + findStr + "%");
			ps.setString(3, "%" + findStr + "%");
			ps.setString(4, "%" + findStr + "%");
			ps.setString(5, "%" + findStr + "%");
			
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
	
	public List<MemberVo> select(String findStr){
		pageCompute(findStr);
		List<MemberVo> list = new ArrayList<>();
		String sql = "select * from "
				+ "	(	select rownum num, r.* from "
				+ "	 	( 	select * from student where "
								+ "	id like ? "
								+ " or name like ? "
								+ " or phone like ? "
								+ " or address like ? "
								+ " or email like ? "
				+ "		)r"
				+ "  ) where num between ? and ? ";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + findStr + "%");
			ps.setString(2, "%" + findStr + "%");
			ps.setString(3, "%" + findStr + "%");
			ps.setString(4, "%" + findStr + "%");
			ps.setString(5, "%" + findStr + "%");
			ps.setInt(6, startNo);
			ps.setInt(7, endNo);
			
			 
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				MemberVo v = new MemberVo();
				v.setId(rs.getString("id"));
				v.setName(rs.getString("name"));
				v.setPhone(rs.getString("phone"));
				v.setPwd(rs.getString("pwd"));
				v.setPost(rs.getString("post"));
				v.setAr(rs.getString("address"));
				v.setEmail(rs.getString("email"));
				v.setRdate(rs.getDate("rdate").toString());
				v.setPhoto(rs.getString("photo"));
				v.setPhotO(rs.getString("photoOri"));
				
				list.add(v);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			list = null;
		} finally {
			try {
				conn.close();
				conn = null;
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return list;
		}
	}
	
	public boolean insert(MemberVo vo) {
		boolean b = true;
		String sql = "insert into student values(?,?,?,?,?,?,?, sysdate ,? ,?)";
		
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getId());
			ps.setString(2, vo.getName());
			ps.setString(3, vo.getPhone());
			ps.setString(4, vo.getPwd());
			ps.setString(5, vo.getPost());
			ps.setString(6, vo.getAr());
			ps.setString(7, vo.getEmail());
			ps.setString(8, vo.getPhoto());
			ps.setString(9, vo.getPhotO());
			
			int cnt = ps.executeUpdate(); //insert, update, delete 모두 실행할때 사용.
			if (cnt <= 0) b=false;
		} catch(Exception ex) {
			ex.printStackTrace();
			b = false;
		} finally {
			try {
				conn.close();
				conn = null;
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return b;
		}
	}
	
	public boolean update(MemberVo vo) {
		boolean b = true;
		
		String sql = "update student set "
				   + " name = ? , "
				   + " email = ? , "
				   + " phone = ? , "
				   + " post = ? , "
				   + " address = ? , "
				   + " rdate = ? , "
				   + " photo = ? , "
				   + " photoOri = ? "
				   + " where id = ? and pwd = ?";

		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getEmail());
			ps.setString(3, vo.getPhone());
			ps.setString(4, vo.getPost());
			ps.setString(5, vo.getAr());
			ps.setString(6, vo.getRdate());
			ps.setString(7, vo.getPhoto());
			ps.setString(8, vo.getPhotO());
			ps.setString(9, vo.getId());
			ps.setString(10, vo.getPwd());
			
			
			int cnt = ps.executeUpdate(); //insert, update, delete 모두 실행할때 사용.
			if (cnt <= 0) b=false;
			
		} catch (Exception ex) {
			ex.printStackTrace();
			b = false;
		} finally {
			try {
				conn.close();
				conn = null;
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return b;
			
		}
		
		
		
	}
	
	public boolean delete(MemberVo vo) {
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
	
	public MemberVo view(String id) { // 학생 id에 해당하는 1건을 반환하는 메소드
		MemberVo rVo = null;
		String sql = "select * from student where id=?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				rVo = new MemberVo();
				rVo.setId(rs.getString("id"));
				rVo.setName(rs.getString("name"));
				rVo.setPhone(rs.getString("phone"));
				rVo.setPwd(rs.getString("pwd"));
				rVo.setPost(rs.getString("post"));
				rVo.setAr(rs.getString("address"));
				rVo.setEmail(rs.getString("email"));
				rVo.setRdate(rs.getDate("rdate").toString());
				rVo.setPhotO(rs.getString("photoOri"));
				rVo.setPhoto(rs.getString("photo"));
			}
		} catch(Exception ex){
			ex.printStackTrace();
			rVo = null;
		} finally {
			try {
				conn.close();
				conn = null;
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return rVo;
		}
		
	}
	
	public MemberVo login(String id) {
		MemberVo vo = null;
		
		String sql = " select id, pwd from student where id = ?";
		
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				vo = new MemberVo();
				vo.setId(rs.getString("id"));
				vo.setPwd(rs.getString("pwd"));
			}	
		} catch (Exception ex) {
			ex.printStackTrace();
			vo = null;
		} finally {
			try {
				conn.close();
				conn = null;
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return vo;
		}
	}
	
	public MemberVo info(String email) {
		MemberVo vo = null;
		
		String sql = " select id, pwd, email from student where email = ?";
		
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				vo = new MemberVo();
				vo.setId(rs.getString("id"));
				vo.setPwd(rs.getString("pwd"));
				vo.setEmail(rs.getString("email"));
			}	
		} catch (Exception ex) {
			ex.printStackTrace();
			vo = null;
		} finally {
			try {
				conn.close();
				conn = null;
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return vo;
		}
	}
	
	
	
	// 필드변수 getter/setter
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
	
	
	
	
}
