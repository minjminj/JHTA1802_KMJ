package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class Qna_dao {
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

	public Qna_dao() {
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
	
	public void pageCompute() {
		String sql = "select count(qna_code) count from qna  ";
//				+ "where "
//				+ " cud_code = (select cud_code from customer where cud_id = ? )";
		
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
//			ps.setString(1, cud_id );
			
			
			ResultSet rs = ps.executeQuery();
			rs.next();
			
			totSize = rs.getInt("count");
			
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
	
	public List<Qna_vo> select(int prod_code){
		pageCompute();
		List<Qna_vo> list = new ArrayList<>();
		
		String sql = "select * from "
				+ "( select rownum num, r.* from "
				+ "(			select q.qna_sub, q.qna_content, q.qna_date, q.qna_code, q.qna_deep, c.cud_name from qna q join customer c on q.cud_code = c.cud_code where prod_code = ? order by q.qna_grp desc, q.qna_deep )"
				+ " r )"
				+ "where num between ? and ?";
		
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, prod_code);
			ps.setInt(2, startNo);
			ps.setInt(3, endNo);
		
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Qna_vo v = new Qna_vo();
				v.setQna_code(rs.getInt("qna_code"));
				v.setQna_deep(rs.getInt("qna_deep"));
				v.setQna_sub(rs.getString("qna_sub"));
				v.setQna_content(rs.getString("qna_content"));
				v.setQna_date(rs.getDate("qna_date").toString());
				v.setCud_name(rs.getString("cud_name"));
				list.add(v);   
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			list = null;
		} finally {
			return list;
		}
	}
	
	public boolean insert_q(Qna_vo vo, String cud_id){
		boolean b = true;
		String sql = "insert into qna values(sysdate, qna_seq.nextval, ?, ?, (select cud_code from customer where cud_id = ?), ?, qna_seq.currval, ?)";
		
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "제목은 없어");
			ps.setString(2, vo.qna_content);
			ps.setString(3, cud_id);
			ps.setInt(4, vo.prod_code);
			ps.setInt(5, vo.qna_deep);
			
			int cnt = ps.executeUpdate();
			if (cnt <= 0) { b=false; }
			
		} catch (Exception ex) {
			ex.printStackTrace();
			b = false;
		} finally {
			return b;
		}
	}
	
	public boolean insert_a(Qna_vo vo, String cud_id, int q_seq){
		boolean b = true;
		String sql = "insert into qna values(sysdate, qna_seq.nextval, ?, ?, (select cud_code from customer where cud_id = ?), ?, ?, ?)";
		
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "제목은 없어");
			ps.setString(2, vo.qna_content);
			ps.setString(3, cud_id);
			ps.setInt(4, vo.prod_code);
			ps.setInt(5, q_seq);
			ps.setInt(6, vo.qna_deep);
			
			int cnt = ps.executeUpdate();
			if (cnt <= 0) { b=false; }
			
		} catch (Exception ex) {
			ex.printStackTrace();
			b = false;
		} finally {
			return b;
		}
	}
	
	public boolean delete_qna(int qna_code, String cud_id, String cud_pwd) {
		boolean b = true;
		String sql = "delete from qna where qna_code = ? and cud_code = (select cud_code from customer where cud_id = ? and cud_pwd = ?) ";
		
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, qna_code);
			ps.setString(2, cud_id);
			ps.setString(3, cud_pwd);
			
			int cnt = ps.executeUpdate();
			if (cnt <= 0 ) {b=false;}
		} catch (Exception ex) {
			ex.printStackTrace();
			b = false;
		} finally {
			return b;
		}
	}
}
