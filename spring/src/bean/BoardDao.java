package bean;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public class BoardDao {
	
	SqlSession sqlSession;
	
	// 사진 업로드(multipartRequest)를 위한 변수
		String uploadDir = "C:/new_workspace/spring/WebContent/upload/";
		String encType = "utf-8";
		int fileSize = 1024*1024*10; // 10Mb (1024*1024가 1메가)
	
	// pageCompute를 위한 변수
		int listSize = 5;
		int blockSize = 3;
		int nowPage = 1;	// getter/setter 만들어야함 (외부에서 사용해야하기 때문에)
		
		int totSize = 0;
		int totPage =0;		// getter만
		int totBlock = 0;	// getter만
		int nowBlock = 0;	// getter만
		
		int endPage = 0;	// getter만
		int startPage = 0;	// getter만
		
		int endNo = 0;		//getter만
		int startNo = 0;	//getter만
		
		// parameter 처리 변수
		String findStr = "";
		
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
		public int getTotSize() {
			return totSize;
		}
		public String getFindStr() {
			return findStr;
		}
		public void setFindStr(String findStr) {
			this.findStr = findStr;
		}
		
	public BoardDao() {
		sqlSession = StudentFactory.getFatory().openSession();
	}
	
	// 리스트 보기 페이지에서 페이징 처리
	public int pageCompute(String findStr) {
		this.totSize = sqlSession.selectOne("student.list_count", findStr);
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
		
		return totSize;
	}
	
	// 게시판 목록 보기
	public List<BoardVo> select(String findStr){
		pageCompute(findStr);
		
		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("findStr", findStr);
		parameters.put("startNo", startNo);
		parameters.put("endNo", endNo);
		
		List<BoardVo> list = sqlSession.selectList("board.list", parameters);
		return list;
		
	}
}
