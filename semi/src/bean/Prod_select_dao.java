package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.swing.plaf.synth.SynthSliderUI;

public class Prod_select_dao {

	Connection conn;
	
	public Prod_select_dao() {
		conn = new DBConnection().getConn();
	}
	
	int list_size = 10; // 사용자가 직접 몇 개씩 보기 설정할 때 setter를 사용
	int block_size = 5;
	int now_page = 1; // getter, setter

	int tot_size = 0;
	int tot_page = 0; // getter
	int tot_block = 0;
	int now_block = 0;

	int end_page = 0; // getter
	int start_page = 0; // getter

	int end_no = 0; // getter
	int start_no = 0; // getter 펼쳐져있는 페이지의 첫 게시물 번호
	
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
	
	//카테고리가 origin인 상품을 find_str로 검색한 갯수(tot_size)로
	//페이지를 계산합니다.
	public void page_compute(int prod_code) {
		String sql	= " select count(rev.rew_code) cnt from reviews rev "
					+ " join order_list_cnt olc on rev.olc_code = olc.olc_code where "
					+ " olc.prod_code like ? ";
		
		try {
			PreparedStatement ps = conn.prepareStatement(sql);	//
			
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
			if (now_page <= 0) {
				now_page = 1;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	
	//상품 클릭 시 정보 (사진 정보는 가져오지 않음)
	public List find_and_select_product(int prod_code) {
		page_compute(prod_code);
		List list = new ArrayList();
		String sql	= " select * from product pd join product_photo pp "
					+ " on pd.prod_code = pp.prod_code where "
					+ " pd.prod_code = ? ";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, prod_code);
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				Prod_vo v = new Prod_vo();
				Pho_vo pv = new Pho_vo();
				v.setProd_code(prod_code);
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
				pv.setProd_code(prod_code);
				
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
	
	//상품 상세에 뿌릴 사진 목록입니다.
	public List<Pho_vo> find_photo_rename_select_product(int prod_code) {
		List<Pho_vo> list = new ArrayList<Pho_vo>();
		
		String sql	= " select pp.pho_rename2, pp.pho_rename3, pp.pho_rename4 from  product pd join product_photo pp "
					+ " on pd.prod_code = pp.prod_code where "
					+ " pd.prod_code = ? "
					+ " and (pp.pho_rename2 like '%01.jpg' "
					+ " 	or pp.pho_rename3 like '%02.jpg' "
					+ "		or pp.pho_rename4 like '%03.jpg') "
					+ " order by pp.pho_rename2 asc";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, prod_code);
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				Pho_vo pv = new Pho_vo();
				pv.setPho_rename2(rs.getString("pho_rename2"));
				pv.setPho_rename3(rs.getString("pho_rename3"));
				pv.setPho_rename4(rs.getString("pho_rename4"));
				list.add(pv);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			list = null;
		} finally {
			return list;
		}
	}
	//한 상품의 한 아이디가 구매를 한 상태에서 rew_code의 null 여부를 통해 리뷰를 달았는지 안 달았는지 알 수 있음.
	public boolean id_match(String id, int prod_code) {
		boolean result = false;
		String sql	= " select * from reviews r right outer join "
					+ " ( select * from order_list_cnt o join "
					+ " customer c on o.cud_code = c.cud_code join "
					+ " purchase p on p.pur_code = o.pur_code "
					+ " where p.pur_status = '배송완료' "
					+ " and c.cud_id != 'admin' "
					+ " and c.cud_id = ? "
					+ " and o.prod_code = ? "
					+ " ) a on a.olc_code = r.olc_code "
					+ " order by r.rew_code asc ";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setInt(2, prod_code);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				System.out.println(Integer.valueOf(rs.getInt(4)));
				//rev olc_code와 olc olc_code 비교, 널 체크
				if(Integer.valueOf(rs.getInt(4)) == 0) {
					result = true;
				}
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			result = false;
		} finally {
			return result;
		}
	}
}
