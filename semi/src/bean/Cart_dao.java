package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;

import com.sun.crypto.provider.RSACipher;

public class Cart_dao {
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

	public Cart_dao() {
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

	public void pageCompute(String cud_id) {
		String sql = "select count(crt_code) count from cart  where "
				+ " cud_code = (select cud_code from customer where cud_id = ? ) ";
		
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, cud_id );
			
			
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
	
	public List<Cart_vo> select(String cud_id){
		pageCompute(cud_id);
		List<Cart_vo> list = new ArrayList<>();
		
		String sql =  "select * from "
				+ "	(	select rownum num, r.* from "
				+ "	 	(select  c.crt_code, c.crt_cnt, c.prod_code, pr.prod_name, pr.prod_price, pr.prod_content, pr.pho_rename1 "
				+ " from cart c join (select p.prod_code, p.prod_name, p.prod_price, p.prod_content, i.pho_rename1 from product p join product_photo i on p.prod_code = i.prod_code) pr on c.prod_code = pr.prod_code where c.cud_code = (select cud_code from customer where cud_id = ? )"
				+ " )r"
				+ " ) where num between ? and ? ";
 		
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, cud_id);
			System.out.println("select" + cud_id);
			ps.setInt(2, startNo);
			ps.setInt(3, endNo);
		
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Cart_vo v = new Cart_vo();
				v.setCrt_code(rs.getInt("crt_code"));
				v.setCrt_cnt(rs.getInt("crt_cnt"));
				v.setProd_code(rs.getInt("prod_code"));
				v.setProd_price(rs.getInt("prod_price"));
				v.setProd_name(rs.getString("prod_name"));
				v.setProd_content(rs.getString("prod_content"));
				v.setPho_rename1(rs.getString("pho_rename1"));
				list.add(v);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			return list;
		}
	}
	
	public boolean delete(int crt_code) {
		boolean b = true;
		
		String sql = "delete from cart where crt_code = ? ";
		
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, crt_code);
			
			int cnt = ps.executeUpdate();
			if (cnt <= 0 ) b = false;
			
		} catch (Exception ex) {
			ex.printStackTrace();
			b = false;
		} finally {
			return b;
		}
	}
	
	public boolean insert(String cud_id, int crt_cnt, int prod_code) {
		boolean b = true;
		
		String sql = "insert into cart values(crt_seq.nextval, ?, ?, (select cud_code from customer where cud_id = ?))";
		
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, crt_cnt);
			System.out.println("cnt" + crt_cnt);
			ps.setInt(2, prod_code);
			System.out.println("code" + prod_code);
			ps.setString(3, cud_id);
			System.out.println("insert id " + cud_id);
			
			int cnt = ps.executeUpdate();
			if (cnt <= 0 ) b = false;
			
		} catch (Exception ex) {
			ex.printStackTrace();
			b = false;
		} finally {
			return b;
		}
	
	}
		
		
	
	
	public boolean update(int crt_cnt, int crt_code) {
		boolean b = true;
				
		String sql = "update cart set crt_cnt= ? where crt_code= ? ";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, crt_cnt);
			ps.setInt(2, crt_code);
			System.out.println(crt_cnt);
			System.out.println(crt_code);
			
			
			int cnt = ps.executeUpdate();
			if (cnt <= 0 ) b = false;
		} catch (Exception ex){
			ex.printStackTrace();
			b = false;
		} finally {
			return b;
		}
	}
	
	public boolean checkout(String pur_name, String pur_adr, String pur_phone, String pur_memo, int cud_code, int pur_final_price) {
		boolean chk = true;
		String sql = "insert into purchase values(pur_seq.nextval, sysdate, ?, ? ,? ,?, ?, ?, ?)";
		
		try {
			
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "배송준비중");
			ps.setString(2, pur_adr);
			ps.setInt(3, pur_final_price);
			ps.setInt(4, cud_code);
			ps.setString(5, pur_memo);
			ps.setString(6, pur_phone);
			ps.setString(7, pur_name);
			
			System.out.println("쿼리문 치고 excute 하기바로전");
			int cnt = ps.executeUpdate();
			if (cnt <= 0) {
				chk = false;
			}

		} catch(Exception e) {
			e.printStackTrace();
			chk = false;
		}finally {
			System.out.println("쿼리문 끝나고 파이널" + chk);
			return chk;
		}
	}

//	구매목록 리스트 select
	public List checkoutList(int cud_code) {
		List<Checkout_VO> chkList = new ArrayList();
		
		
		String sql = "select * from purchase where cud_code = ?";
		
		try {
			
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, cud_code);
			
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				Checkout_VO vo = new Checkout_VO();
				vo.setPur_code(rs.getInt("pur_code"));
				vo.setPur_date(rs.getDate("pur_date").toString());
				vo.setPur_final_price(rs.getInt("pur_final_price"));
				vo.setPur_name(rs.getString("pur_name"));
				vo.setPur_status(rs.getString("pur_status"));
				
				chkList.add(vo);
				System.out.println("list size = " + chkList.size());
				for (int i = 0 ; i<chkList.size(); i++) {
					System.out.println("servlet list dao = " + (chkList.get(i)).getPur_final_price());
				}
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			return chkList;
		}
		
	}
	
	
}
