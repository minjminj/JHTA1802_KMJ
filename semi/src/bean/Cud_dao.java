package bean;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Cud_dao {
	Connection conn;

	int listSize = 20;
	int blockSize = 10;
	int nowPage = 1;	//getter and setter
	
	int totSize = 0;
	int totPage =0;		//getter
	int totBlock = 0;	//getter
	int nowBlock = 0;	//getter
	
	int endPage = 0;	//getter
	int startPage = 0;	//getter
	
	int endNo = 0;		//getter
	int startNo = 0;	//getter
	
	public Cud_dao() {
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

	public int getTotBlock() {
		return totBlock;
	}

	public int getNowBlock() {
		return nowBlock;
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
	
	public boolean insert(Cud_vo vo) {
		boolean b = true;
		String sql = "insert into customer values (cud_seq.nextval, ?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getCud_id());
			ps.setString(2, vo.getCud_name());
			ps.setString(3, vo.getCud_pwd());
			ps.setString(4, vo.getCud_pwdchk());
			ps.setString(5, vo.getCud_pwdans());
			ps.setString(6, vo.getCud_phone());
			
			int cnt = ps.executeUpdate();
			if (cnt <= 0) { b = false; }
		} catch (Exception ex){
			ex.printStackTrace();
			b = false;
		} finally {
			return b;
		}
	}
	
	public Cud_vo login(String cud_id, String cud_pwd) {
		Cud_vo vo = new Cud_vo();
		String sql = "select * from customer where cud_id = ? and cud_pwd = ?";

		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, cud_id);
			ps.setString(2, cud_pwd);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
			vo.setCud_code(rs.getInt("cud_code"));
			vo.setCud_id(rs.getString("cud_id"));
			vo.setCud_name(rs.getString("cud_name"));
			vo.setCud_pwd(rs.getString("cud_pwd"));
			vo.setCud_pwdchk(rs.getString("cud_pwdchk"));
			vo.setCud_pwdans(rs.getString("cud_pwdans"));
			vo.setCud_phone(rs.getString("cud_phone"));
			}
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			return vo;
		}
	}
	
	public String forgitId(String cud_name, String cud_phone) {
		String forgitId = "";
		String sql = "select cud_id from customer where cud_name = ? and cud_phone = ?";
		
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, cud_name);
			ps.setString(2, cud_phone);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				forgitId = rs.getString("cud_id");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return forgitId;
	}
	
	public String forgitPwd(String cud_id, String cud_pwdchk, String cud_pwdans) {
		
		String forgitPwd = "";
		String sql = "select cud_pwd from customer where cud_id = ? and cud_pwdchk = ? and cud_pwdans = ?";
		
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, cud_id);
			ps.setString(2, cud_pwdchk);
			ps.setString(3, cud_pwdans);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				forgitPwd = rs.getString("cud_pwd");
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return forgitPwd;
	}
	
	
	/*admin 페이지에서 회원 목록 호출을 위한 코드 -kms (pageCompute / select)*/
	
	public void pageCompute(String findStr) {
		String sql = "select count(cud_code) cnt from CUSTOMER where cud_code like ? or cud_name like ?";

		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%"+ findStr + "%");
			ps.setString(2, "%"+ findStr + "%");
			
			ResultSet rs = ps.executeQuery();
			rs.next();

			totSize = rs.getInt("cnt");
			
			totPage  = (int)Math.ceil(totSize/(double)listSize);
			totBlock = (int)Math.ceil(totPage/(double)blockSize);
			nowBlock = (int)Math.ceil(nowPage/(double)blockSize);

			endPage   = nowBlock * blockSize;
			startPage = endPage - blockSize + 1;
			if(endPage > totPage) endPage = totPage;

			endNo   = nowPage * listSize;
			startNo = endNo - listSize + 1;
			if(endNo > totSize) endNo = totSize;
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	public List<Cud_vo> select(String findStr){
		pageCompute(findStr);
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Cud_vo> list = new ArrayList<Cud_vo>();
		String sql = "select * from (select rownum num, r.* from (select * from CUSTOMER where cud_code like ? or cud_name like ? order by cud_code desc)r ) where num between ? and ?";

		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%"+ findStr + "%");
			ps.setString(2, "%"+ findStr + "%");
			ps.setInt(3, startNo);
			ps.setInt(4, endNo);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				Cud_vo v = new Cud_vo();
				v.setCud_code(rs.getInt("cud_code"));
				v.setCud_id(rs.getString("cud_id"));
				v.setCud_name(rs.getString("cud_name"));
				v.setCud_phone(rs.getString("cud_phone"));
				list.add(v);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			list = null;
		}
		return list;
		
	}
	
	
	public boolean delete(int cud_code) {
		boolean b = true;
		String sql = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			
			sql = "delete from customer where cud_code=?";
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, cud_code);
			int cnt = ps.executeUpdate();
			
			if(cnt<0) {
				b = false;
			}else {
				b = true;
			}
					
		}catch(Exception ex) {
			ex.printStackTrace();
			b=false;
			try {
				conn.rollback();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return b;
	}
	
	
	
	
	
}
