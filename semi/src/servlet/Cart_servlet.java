package servlet;

import java.io.IOException;
import java.util.Enumeration;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Cart_dao;
import bean.Cart_vo;
import bean.Checkout_VO;
import bean.Cud_vo;

public class Cart_servlet extends HttpServlet{

	String index = "index.jsp?content=";
	String content = "";
	String msg = "";
	
	
	
	Cart_dao dao = new Cart_dao();
	@Override
	public void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("text/html;charset=utf-8");
		
		String temp = req.getServletPath();
		String url = temp.substring(1, temp.indexOf("."));
		
		switch(url) {
		
		case "go_cart":
			go_cart(req, resp);
			break;
		case "cart_delete":
			cart_delete(req, resp);
			content = "cart/cart.jsp";
			break;
		case "add_cart":
			add_cart(req, resp);
			break;
		case "update_cart":
			update_cart(req, resp);
			break;
		case "checkoutData":
			checkoutData(req, resp);
			break;
		case "checkout":
			checkout(req, resp);
			break;
		case "checkoutList":
			checkoutList(req, resp);
			break;
		}
		
		req.setAttribute("content", content);
		req.setAttribute("msg", msg);
		RequestDispatcher disp = req.getRequestDispatcher(index + content);
		disp.forward(req, resp);
	}
	
	public void go_cart(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Cud_vo cvo = (Cud_vo)req.getSession().getAttribute("vo");
		
		  if(cvo == null) {
			  content = "member/login.jsp";
				
		  }else {
			  String id = cvo.getCud_id();	
			  List<Cart_vo> v = dao.select(id);
			  content = "cart/cart.jsp";
			  req.setAttribute("v", v);
		  }
					
	}
	
	public void cart_delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Cud_vo cvo = (Cud_vo)req.getSession().getAttribute("vo");
		String id = cvo.getCud_id();	
		int crt_code = Integer.parseInt(req.getParameter("crt_code"));
	   
	  
	      if (dao.delete(crt_code)) {   
	         List<Cart_vo> v = dao.select(id);
	         content = "cart/cart.jsp";
	         req.setAttribute("v", v);
	      } else {
	         content = "cart/cart.jsp";
	        // msg = "장바구니 목록 삭제 실패";
	      }
	      
	   }
	
	public void add_cart(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Cud_vo cvo = (Cud_vo)req.getSession().getAttribute("vo");
		int cnt = Integer.parseInt(req.getParameter("crt_cnt"));
		int code = Integer.parseInt(req.getParameter("prod_code"));
		String id = cvo.getCud_id();
		
		if (dao.insert(id, cnt, code)) {
			List<Cart_vo> v = dao.select(id);
			content = "cart/cart.jsp";
			req.setAttribute("v", v);
					
		}
	}
	
	public void update_cart(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Cud_vo cvo = (Cud_vo)req.getSession().getAttribute("vo");
		String id = cvo.getCud_id();
		 int code = Integer.parseInt(req.getParameter("code"));
		 int cnt = Integer.parseInt(req.getParameter("cnt"));
		 
		 if (dao.update(cnt, code)) {
			 List<Cart_vo> v = dao.select(id);
				content = "cart/cart.jsp";
				req.setAttribute("v", v);
			} else {
				  content = "cart/cart.jsp";
			      msg = "장바구니 목록 수정 실패";
		 }
	}
	
//	결재란에서 결재를 클릭하면 데이터를 가지고 디비로
	public void checkout(HttpServletRequest req, HttpServletResponse resp) {
		Cart_dao dao = new Cart_dao();
		
		String pur_name  = req.getParameter("pur_name"),
			   pur_adr   = req.getParameter("pur_adr"),
			   pur_phone = req.getParameter("pur_phone"),
			   pur_memo  = req.getParameter("pur_memo");
		int    cud_code  = Integer.parseInt(req.getParameter("cud_code")),
			   pur_final_price = Integer.parseInt(req.getParameter("pur_final_price"));
		
		System.out.println("서블릿 처음 파라메타결과" + req.getParameter("pur_name"));
		boolean chk = dao.checkout(pur_name, pur_adr, pur_phone, pur_memo, cud_code, pur_final_price);
		System.out.println("dao끝나고 서블릿결과" + chk);
		if (chk) {
			content = "cart/completePayment.jsp";
		} else {
			content = "cart/error.jsp";
		}
	}	

//	결재란으로 데이터를 보내는 메소드
	public void checkoutData(HttpServletRequest req, HttpServletResponse resp) {
		int totalPrice = 0;
		
		Map chkDataMap = new LinkedHashMap();
		List chkData = new LinkedList();
		Checkout_VO vo = new Checkout_VO();
		Enumeration params = req.getParameterNames();
		
		while(params.hasMoreElements()) {
			String data = (String) params.nextElement();
			String param = req.getParameter(data);
			/*data = data.substring(0, 9);*/
			
			chkDataMap.put(data, param);
			System.out.println("chkDataMap(map) = " + chkDataMap);
			System.out.println("와일문 리스트" + chkData);
			if (chkDataMap.size()%2 == 0) {
			chkData.add(chkDataMap);
			}
		}
		
		System.out.println("map size = " + chkDataMap.size());
		System.out.println("List size = " + chkData.size());
//		총가격을 구하기 위해 널 값을 먼저 검사하고 
		if (chkDataMap.size() >= 1) {
//			totalPrice += Integer.parseInt((String) chkDataMap.get("prod_price"));
//			System.out.println("totalPriceMap = " + totalPrice);

//			리스트 포문을 돌려서 리스트 번지수에서 prod_price를 가져와 합을 구함
//			구매물품이 여러개일 경우..
			for(int i = 0; i < chkDataMap.size()/2; i++) {
				System.out.println("chkData = " + totalPrice);
				totalPrice += Integer.parseInt((String) chkDataMap.get("prod_pric"+i));
				System.out.println(i + " = " + chkDataMap.get("prod_pric"));
				System.out.println();
			} 
			
//			구매물품이 한개일 경우....
			} /*else if (chkDataMap.size() < 3) {
				System.out.println("chkData = " + totalPrice);
				totalPrice += Integer.parseInt((String) chkDataMap.get("prod_price"));
				req.setAttribute("totalPrice", totalPrice);
		}*/
		for (int i = 0; i < chkData.size(); i++) {
			System.out.println("list 사이즈 최종 = " + chkData.get(i));
		}
		
		System.out.println("totalPrice = " + totalPrice);
		req.setAttribute("totalPrice", totalPrice);
		req.setAttribute("chkData", chkData);
		
		content = "cart/checkout.jsp";
	}
	
//	구매목록 리스트
	public void checkoutList(HttpServletRequest req, HttpServletResponse resp) {
		Cart_dao dao = new Cart_dao();
		Cud_vo vo = (Cud_vo) req.getSession().getAttribute("vo");
		int cud_code = vo.getCud_code();
		
		List<Checkout_VO> chkList = dao.checkoutList(cud_code);
		for (int i = 0 ; i<chkList.size(); i++) {
			System.out.println("servlet list = " + chkList.get(i).getPur_final_price());
		}
		
		req.setAttribute("chkList", chkList);
		content = "cart/checkoutList.jsp";
		
	}

}