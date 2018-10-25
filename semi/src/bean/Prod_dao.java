package bean;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.awt.image.renderable.ParameterBlock;
import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.imageio.ImageIO;
import javax.media.jai.JAI;
import javax.media.jai.RenderedOp;
import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class Prod_dao {
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	String uploadDir = "C:/Users/JHTA/git/coding_villain/semi/WebContent/upload_image/";
	String encType = "utf-8";
	int fileSize = 1024 * 1024 * 50;

	ParameterBlock pb = null;
	RenderedOp op = null;
	BufferedImage bi = null;
	BufferedImage thumb = null;
	Graphics2D g = null;
	File file = null;
	
	int listSize = 20;
	int blockSize = 10;
	int nowPage = 1;
	int totSize = 0;
	int totPage  = 0;
	int totBlock = 0;
	int nowBlock = 0;
	int endPage   = 0;
	int startPage = 0;
	int endNo   = 0;
	int startNo = 0;
	
	
	public Prod_dao() {
		// TODO Auto-generated constructor stub
		conn = new DBConnection().getConn();
	}
	
	
	public boolean register(HttpServletRequest req) {
		boolean b = true;
		
		MultipartRequest multi = fileUpload(req);

		Prod_dao dao = new Prod_dao();
		Prod_vo prodVo = setProdVo(multi);
		Pho_vo phoVo = setPhoVo(multi);
		String msg = "";
		
		String sql = "insert all into product values (prod_seq.nextval,?,?,?,?,?,?) into product_photo values (?,?,?,?,?,?,?,?,prod_seq.currval) select * from dual";
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, prodVo.getProd_name());
			ps.setInt(2, prodVo.getProd_price());
			ps.setInt(3, prodVo.getProd_inven());
			ps.setString(4, prodVo.getProd_region());
			ps.setString(5, prodVo.getProd_cate());
			ps.setString(6, prodVo.getProd_content());
			ps.setString(7, phoVo.getPho_rename1());
			ps.setString(8, phoVo.getPho_name1());
			ps.setString(9, phoVo.getPho_rename2());
			ps.setString(10, phoVo.getPho_name2());
			ps.setString(11, phoVo.getPho_rename3());
			ps.setString(12, phoVo.getPho_name3());
			ps.setString(13, phoVo.getPho_rename4());
			ps.setString(14, phoVo.getPho_name4());
			
			if(ps.executeUpdate() < 1) {
				b = false;
			}else {
				b = true;
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			b = false;
		}
		
		
		return b;
	}
	
	
	public MultipartRequest fileUpload(HttpServletRequest req) {
		MultipartRequest multi = null;
		try {
			multi = new MultipartRequest(req, uploadDir, fileSize, encType, new DefaultFileRenamePolicy());

			Enumeration tags = multi.getFileNames();

			while (tags.hasMoreElements()) {
				String tag = (String) tags.nextElement();
				String reName = multi.getFilesystemName(tag);
				String fileName = multi.getOriginalFileName(tag);

				if (reName == null)
					break;

				// thumb nail 생성
				pb = new ParameterBlock();
				pb.add(uploadDir + reName);
				op = JAI.create("fileload", pb);

				bi = op.getAsBufferedImage();
				thumb = new BufferedImage(70, 70, BufferedImage.TYPE_INT_RGB);

				g = thumb.createGraphics();
				g.drawImage(bi, 0, 0, 70, 70, null);

				file = new File(uploadDir + "sm_" + reName);
				String ext = reName.substring(reName.indexOf(".") + 1);

				ImageIO.write(thumb, ext, file);

				System.gc();

			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return multi;
	}
	

	public Prod_vo setProdVo(MultipartRequest req) {
		Prod_vo v = new Prod_vo();
		
		v.setProd_name(req.getParameter("prod_name"));
		v.setProd_price(Integer.parseInt(req.getParameter("prod_price")));
		v.setProd_inven(Integer.parseInt(req.getParameter("prod_inven")));
		v.setProd_region(req.getParameter("prod_region"));
		v.setProd_cate(req.getParameter("prod_cate"));
		v.setProd_content(req.getParameter("prod_content"));

		return v;
	}


	public Pho_vo setPhoVo(MultipartRequest req) {
		Pho_vo v = new Pho_vo();
		List<String> list = new ArrayList<String>();
		
		// file 태그명과 원본파일명, 변경된 파일명의 정보
		Enumeration tags = req.getFileNames();
		while (tags.hasMoreElements()) {
			String tag = (String) tags.nextElement();
			String reName = req.getFilesystemName(tag);
			String fileName = req.getOriginalFileName(tag);
			list.add(reName);
			list.add(fileName);
		}
		v.setPho_rename1(list.get(0));
		v.setPho_name1(list.get(1));
		v.setPho_rename2(list.get(2));
		v.setPho_name2(list.get(3));
		v.setPho_rename3(list.get(4));
		v.setPho_name3(list.get(5));
		v.setPho_rename4(list.get(6));
		v.setPho_name4(list.get(7));
		
		return v;
		
	}
	
	
	public void pageCompute(String findStr) {
		String sql = "select count(prod_code) cnt from product where prod_code like ? or prod_name like ?";

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
	
	public List<Prod_vo> select(String findStr){
		pageCompute(findStr);
		List<Prod_vo> list = new ArrayList<Prod_vo>();
		String sql = "select * from (select rownum num, r.* from (select * from product where prod_code like ? or prod_name like ? order by prod_code desc)r ) where num between ? and ?";

		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%"+ findStr + "%");
			ps.setString(2, "%"+ findStr + "%");
			ps.setInt(3, startNo);
			ps.setInt(4, endNo);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				Prod_vo v = new Prod_vo();
				v.setProd_code(rs.getInt("prod_code"));
				v.setProd_name(rs.getString("prod_name"));
				v.setProd_inven(rs.getInt("prod_inven"));
				list.add(v);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			list = null;
		}
		return list;
		
		
	}


	public Prod_vo view(int pCode) {
		Prod_vo vo = null;
		String sql = "select * from product where prod_code = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, pCode);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				vo = new Prod_vo();
				vo.setProd_code(rs.getInt("prod_code"));
				vo.setProd_name(rs.getString("prod_name"));
				vo.setProd_price(rs.getInt("prod_price"));
				vo.setProd_inven(rs.getInt("prod_inven"));
				vo.setProd_region(rs.getString("prod_region"));
				vo.setProd_cate(rs.getString("prod_cate"));
				vo.setProd_content(rs.getString("prod_content"));
			}
		}catch(Exception ex) {
			ex.printStackTrace();
			vo = null;
		}finally {
			return vo;
		}
	}
	
	
	/* oracle db 트기거 prod_photo를 사용하여 product 테이블의 행 삭제 시 product_photo 테이블의 행 삭제 */
	public boolean delete(int pCode) {
		boolean b = true;
		String sql = null;

		try {
			sql = "delete from product where prod_code=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1,  pCode);
			int cnt = ps.executeUpdate();
			
			if(cnt<0) {
				b = false;
			}else {
				b = true;
			}
					
		}catch(Exception ex) {
			ex.printStackTrace();
			b=false;
		}finally {
			return b;
		}
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*
	 * 페이지 처리를 위한 set/get 메서드
	 */
	
	public int getListSize() {
		return listSize;
	}


	public void setListSize(int listSize) {
		this.listSize = listSize;
	}


	public int getBlockSize() {
		return blockSize;
	}


	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}


	public int getNowPage() {
		return nowPage;
	}


	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}


	public int getTotSize() {
		return totSize;
	}


	public void setTotSize(int totSize) {
		this.totSize = totSize;
	}


	public int getTotPage() {
		return totPage;
	}


	public void setTotPage(int totPage) {
		this.totPage = totPage;
	}


	public int getTotBlock() {
		return totBlock;
	}


	public void setTotBlock(int totBlock) {
		this.totBlock = totBlock;
	}


	public int getNowBlock() {
		return nowBlock;
	}


	public void setNowBlock(int nowBlock) {
		this.nowBlock = nowBlock;
	}


	public int getEndPage() {
		return endPage;
	}


	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}


	public int getStartPage() {
		return startPage;
	}


	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}


	public int getEndNo() {
		return endNo;
	}


	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}


	public int getStartNo() {
		return startNo;
	}


	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}
	
	
	
	
	
	
	
	

}
