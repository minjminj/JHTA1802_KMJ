package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class Prod_blend_dao {

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

	public Prod_blend_dao() {
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
	
	//카테고리가 blend인 상품을 find_str로 검색한 갯수(tot_size)로
	//페이지를 계산합니다.
	public void page_compute(String find_str) {
		String sql	= "select count(prod_code) cnt from product where "
					+ " (prod_name like ? "
					+ " or prod_content like ?)"
					+ " and prod_cate = 'blend' ";
		
		try {
			PreparedStatement ps = conn.prepareStatement(sql);	//
			
			ps.setString(1, "%" + find_str + "%");
			ps.setString(2, "%" + find_str + "%");
			
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
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	//blend 카테고리에 있는 상품정보만 가져오기(Prod_Servlet.java 에서 사용)
	// 상품 코드 하나에 상품 사진 하나만 가져옵니다.
	public List blend_select(String find_str) {
		page_compute(find_str);	//
		List list = new ArrayList();
		
		//find_str로 blend카테고리 중 상품이름, 상품 상세내용을 검색합니다.
		String sql	= "select * from ( "
				+ " select rownum num, r.* from ( "
				+ " select * from product pd join product_photo pp "
				+ " on pd.prod_code = pp.prod_code where "
				+ " (pd.prod_name like ? "
				+ " or pd.prod_content like ? ) "
				+ " and pd.prod_cate = 'blend' "
				+ " and pp.pho_rename1 like '%00.jpg' "
				+ " order by pd.prod_code desc "
				+ " )r "
				+ " ) where num between ? and ? ";;
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + find_str + "%");
			ps.setString(2, "%" + find_str + "%");
			ps.setInt(3, start_no);
			ps.setInt(4, end_no);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Prod_vo v = new Prod_vo();
				Pho_vo pv = new Pho_vo();
				v.setProd_code(rs.getInt("prod_code"));
				v.setProd_name(rs.getString("prod_name"));
				v.setProd_price(rs.getInt("prod_price"));
				v.setProd_inven(rs.getInt("prod_inven"));
				v.setProd_region(rs.getString("prod_region"));
				v.setProd_cate(rs.getString("prod_cate"));
				v.setProd_content(rs.getString("prod_content"));
				
				//product_photo 테이블의 정보 가져오기
				pv.setPho_rename1(rs.getString("pho_rename1"));
				pv.setPho_rename2(rs.getString("pho_rename2"));
				pv.setPho_rename3(rs.getString("pho_rename3"));
				pv.setPho_rename4(rs.getString("pho_rename4"));
				pv.setProd_code(rs.getInt("prod_code"));
				
				v.setPho_vo(pv);
				list.add(v);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			list = null;
		} finally {
			return list;
		}
	}
}
