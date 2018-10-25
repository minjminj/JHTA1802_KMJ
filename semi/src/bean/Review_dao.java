package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class Review_dao {
Connection conn;
	
	int list_size = 3; // 사용자가 직접 몇 개씩 보기 설정할 때 setter를 사용
	int block_size = 2;
	int now_page = 1; // getter, setter

	int tot_size = 0;
	int tot_page = 0; // getter
	int tot_block = 0;
	int now_block = 0;

	int end_page = 0; // getter
	int start_page = 0; // getter

	int end_no = 0; // getter
	int start_no = 0; // getter 펼쳐져있는 페이지의 첫 게시물 번호

	public Review_dao() {
		conn = new DBConnection().getConn();
	}
	
	public int getTot_block() {
		return tot_block;
	}

	public int getNow_page() {
		return now_page;
	}

	public void setNow_page(int now_page) {
		this.now_page = now_page;
	}

	public int getTot_page() {
		return tot_page;
	}

	public int getEnd_page() {
		return end_page;
	}

	public int getStart_page() {
		return start_page;
	}

	public int getEnd_no() {
		return end_no;
	}

	public int getStart_no() {
		return start_no;
	}

	public int getNow_block() {
		return now_block;
	}
	
	//리뷰 갯수를 가져와 페이지를 계산합니다.
	public void page_compute(int prod_code) {
		String sql	= "select count(rev.rew_code) cnt "
					+ " from reviews rev join order_list_cnt olc "
					+ " on rev.olc_code = olc.olc_code "
					+ " where olc.prod_code = ? ";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, prod_code);
			
			ResultSet rs = ps.executeQuery();
			rs.next();

			tot_size = rs.getInt("cnt");

			tot_page = (int) Math.ceil(tot_size / (double) list_size);
			tot_block = (int) Math.ceil(tot_page / (double) block_size);
			now_block = (int) Math.ceil(now_page / (double) block_size);
			
			end_page = now_block * block_size;
			start_page = end_page - block_size + 1;
			
			if (end_page > tot_page) {
				end_page = tot_page;
			}
			if (start_page < 1) {
				start_page = 1;
			}

			end_no = now_page * list_size;
			start_no = end_no - list_size + 1;
			if (end_no > tot_size) {
				end_no = tot_size;
			}
			if (start_no < 1) {
				start_no = 1;
			}
			if (now_block < 1) {
				now_block = 1;
			}
			if(now_page < 1) {
				now_page = 1;
			}
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	
	//상품코드, 리뷰 내용, 리뷰 작성 날짜, 리뷰 번호, 부모 리뷰 여부, 회원이름을 가져옵니다.
	public List review_select(int prod_code) {
		page_compute(prod_code);
		List list = new ArrayList();
		
		String sql	= " select * from ( "
					+ " select rownum num, r.* from ( "
					+ " select rev.*, cud.cud_id "
					+ " from reviews rev join order_list_cnt olc "
					+ " on rev.olc_code = olc.olc_code "
					+ " join customer cud on cud.cud_code = olc.cud_code "
					+ " where olc.prod_code = ? "
					+ " order by rev.rew_date desc "
					+ " )r "
					+ " ) where num between ? and ? "
					+ " order by decode( "
					+ " rew_grp, null, rew_grp, to_char(rew_date, 'YYYYMMDDHH24mmss')) desc ";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, prod_code);
			ps.setInt(2, start_no);
			ps.setInt(3, end_no);
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				Review_vo review_vo = new Review_vo();
				Cud_vo cud_vo = new Cud_vo();
				review_vo.setRew_code(rs.getInt("rew_code"));
				review_vo.setRew_content(rs.getString("rew_content"));
				review_vo.setRew_date(rs.getDate("rew_date").toString());
				review_vo.setOlc_code(rs.getInt("olc_code"));
				review_vo.setRew_seq(rs.getInt("rew_seq"));
				review_vo.setRew_grp(rs.getInt("rew_grp"));
				cud_vo.setCud_id(rs.getString("cud_id"));
				
				review_vo.setCud_vo(cud_vo);
				list.add(review_vo);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			list = null;
		} finally {
			return list;
		}
	}
	
	public boolean review_insert(String rew_content, String cud_id, int prod_code) {
		boolean result = true;
		String sql	= " insert into reviews values "
					+ " (rew_seq.nextval, ?, sysdate, ( "
					+ " select o.olc_code "
					+ " from order_list_cnt o "
					+ " join customer c "
					+ " on o.cud_code = c.cud_code "
					+ " join product p "
					+ " on p.prod_code = o.prod_code "
					+ " where c.cud_id = ? "
					+ " and p.prod_code = ? ) "
					+ " , rew_seq.nextval, null )";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, rew_content);
			ps.setString(2, cud_id);
			ps.setInt(3, prod_code);
			int cnt = ps.executeUpdate();	//업데이트 된 갯수를 리턴
			if(cnt <= 0) {
				result = false;
			}
		} catch (Exception ex) {
			result = false;
			ex.printStackTrace();
		} finally {
			return result;
		}
	}
	
	public boolean reply_insert(String rew_content, String cud_id, int prod_code, int rew_grp) {
		boolean result = true;
		String sql	= " insert into reviews values "
					+ " (rew_seq.nextval, ?, sysdate, ( "
					+ " select o.olc_code "
					+ " from order_list_cnt o "
					+ " join customer c "
					+ " on o.cud_code = c.cud_code "
					+ " join product p "
					+ " on p.prod_code = o.prod_code "
					+ " where c.cud_id = ? "
					+ " and p.prod_code = ? ) "
					+ " , rew_seq.nextval, ?) ";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, rew_content);
			ps.setString(2, cud_id);
			ps.setInt(3, prod_code);
			ps.setInt(4, rew_grp);
			int cnt = ps.executeUpdate();	//업데이트 된 갯수를 리턴
			if(cnt <= 0) {
				result = false;
			}
		} catch (Exception ex) {
			result = false;
			ex.printStackTrace();
		} finally {
			return result;
		}
	}
}
