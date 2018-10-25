/*
	3개의 카테고리 별로
	find_str(nav에서 값 받아와야함)
	now_page, 카테고리 별 상품 정보를
	각 카테고리 페이지로 보냄
*/

package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Cud_vo;
import bean.Prod_blend_dao;
import bean.Prod_cold_dao;
import bean.Prod_origin_dao;
import bean.Prod_select_dao;
import bean.Qna_dao;
import bean.Qna_vo;
import bean.Review_dao;

public class Prod_servlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("text/html);charset=utf-8");

		String temp = req.getRequestURI();
		String find_str = "";

		// origin일 때
		if (temp.indexOf("origin_list.prod") >= 0) {
			Prod_origin_dao prod_origin_dao = new Prod_origin_dao();
			int now_page = 1;
			if (req.getParameter("now_page") != null) {
				now_page = Integer.parseInt(req.getParameter("now_page"));
			}

			if (req.getParameter("find_str") != null) {
				find_str = req.getParameter("find_str");
			}
			prod_origin_dao.setNow_page(now_page);
			List prod_origin_list = prod_origin_dao.origin_select(find_str);

			// 상품 페이징 정보, find_str, origin상품 정보를 보냄
			req.setAttribute("prod_origin_list", prod_origin_list);
			req.setAttribute("find_str", find_str);
			req.setAttribute("prod_origin_dao", prod_origin_dao);

			RequestDispatcher prod_origin_disp = req.getRequestDispatcher("index.jsp?content=product/origin.jsp");
			prod_origin_disp.forward(req, resp);

			// blend일 때
		} else if (temp.indexOf("blend_list.prod") >= 0) {
			Prod_blend_dao prod_blend_dao = new Prod_blend_dao();
			int now_page = 1;
			if (req.getParameter("now_page") != null) {
				now_page = Integer.parseInt(req.getParameter("now_page"));
			}

			if (req.getParameter("find_str") != null) {
				find_str = req.getParameter("find_str");
			}
			prod_blend_dao.setNow_page(now_page);
			List prod_blend_list = prod_blend_dao.blend_select(find_str);

			req.setAttribute("prod_blend_list", prod_blend_list);
			req.setAttribute("find_str", find_str);
			req.setAttribute("prod_blend_dao", prod_blend_dao);

			// 상품 페이징 정보, find_str, blend상품 정보를 보냄
			RequestDispatcher prod_blend_disp = req.getRequestDispatcher("index.jsp?content=product/blend.jsp");
			prod_blend_disp.forward(req, resp);

			// dutch, cold 일 때
		} else if (temp.indexOf("dutch_cold_list.prod") >= 0) {
			Prod_cold_dao prod_cold_dao = new Prod_cold_dao();
			int now_page = 1;
			if (req.getParameter("now_page") != null) {
				now_page = Integer.parseInt(req.getParameter("now_page"));
			}

			if (req.getParameter("find_str") != null) {
				find_str = req.getParameter("find_str");
			}
			prod_cold_dao.setNow_page(now_page);
			List prod_cold_list = prod_cold_dao.cold_select(find_str);

			req.setAttribute("prod_cold_list", prod_cold_list);
			req.setAttribute("find_str", find_str);
			req.setAttribute("prod_cold_dao", prod_cold_dao);

			// 상품 페이징 정보, find_str, dutch, cold상품 정보를 보냄
			RequestDispatcher prod_cold_disp = req.getRequestDispatcher("index.jsp?content=product/cold.jsp");
			prod_cold_disp.forward(req, resp);

			// 상품 상세정보
		} else if (temp.indexOf("prod_detail.prod") >= 0) {

			Prod_select_dao prod_select_dao = new Prod_select_dao();
			Review_dao review_dao = new Review_dao();
			Qna_dao qdao = new Qna_dao();
			find_str = "";
			int prod_code = 0;
			boolean review = false;
			String id = null;
			int now_page = 1;
			
			if (req.getParameter("find_str") != null) {
				find_str = req.getParameter("find_str");
			}
			
			if (req.getParameter("prod_code") != null) {
				prod_code = Integer.parseInt(req.getParameter("prod_code"));
			}
			
			/****************** review 시작 ******************/
			Cud_vo cud_vo = (Cud_vo) req.getSession().getAttribute("vo");
			if (cud_vo != null) {
				id = cud_vo.getCud_id();
				review = prod_select_dao.id_match(id, prod_code);
			}
			/****************** review 끝 ******************/
			
			List prod_select_list = prod_select_dao.find_and_select_product(prod_code);
			List prod_photo_detail_list = prod_select_dao.find_photo_rename_select_product(prod_code);
			List prod_review_list = review_dao.review_select(prod_code);
			// 상품 페이징 정보, find_str, 상품 정보, review boolean을 보냄
			req.setAttribute("prod_select_list", prod_select_list);
			req.setAttribute("find_str", find_str);
			req.setAttribute("prod_photo_detail_list", prod_photo_detail_list);
			req.setAttribute("prod_review_list", prod_review_list);
			req.setAttribute("review", review);
			req.setAttribute("now_page", now_page);
			
			/****************** qna 시작 ******************/
			List<Qna_vo> qna = qdao.select(prod_code);
			req.setAttribute("qna", qna);
			/****************** qna 끝 ******************/
			RequestDispatcher prod_select_disp = req.getRequestDispatcher("index.jsp?content=product/prod_detail.jsp");
			prod_select_disp.forward(req, resp);
			
		} else if(temp.indexOf("review_insert.prod") >= 0) {
			
			Review_dao review_dao = new Review_dao();
			String content = null;
			String cud_id = null;
			int prod_code = 0;
			Cud_vo cud_vo = (Cud_vo) req.getSession().getAttribute("vo");
			boolean insert = false;
			
			if(req.getParameter("review_textarea") != null) {
				content = req.getParameter("review_textarea");
			}
			if(cud_vo != null) {
				cud_id = cud_vo.getCud_id();
			}
			if(req.getParameter("review_prod_code") != null) {
				prod_code = Integer.parseInt(req.getParameter("review_prod_code"));
			}
			
			insert = review_dao.review_insert(content, cud_id, prod_code);
			req.setAttribute("insert", insert);
			RequestDispatcher rd = req.getRequestDispatcher("index.jsp?content=product/prod_detail.jsp");
			rd.forward(req, resp);
		} else if (temp.indexOf("reply_insert.prod") >= 0) {
			
			Review_dao review_dao = new Review_dao();
			String content = null;
			String cud_id = null;
			int prod_code = 0;
			int rew_grp = 0;
			Cud_vo cud_vo = (Cud_vo) req.getSession().getAttribute("vo");
			boolean insert = false;
			
			if(req.getParameter("reply_textarea") != null) {
				content = req.getParameter("reply_textarea");
			}
			if(cud_vo != null) {
				cud_id = cud_vo.getCud_id();
			}
			if(req.getParameter("review_prod_code") != null) {
				prod_code = Integer.parseInt(req.getParameter("review_prod_code"));
			}
			if(req.getParameter("review_code") != null) {
				rew_grp = Integer.parseInt(req.getParameter("parent_review_code"));
			}
			
			insert = review_dao.reply_insert(content, cud_id, prod_code, rew_grp);
			req.setAttribute("insert", insert);
			RequestDispatcher rd = req.getRequestDispatcher("index.jsp?content=product/prod_detail.jsp");
			rd.forward(req, resp);
		} else if (temp.indexOf("insert_q.prod") >= 0) {
			// setVo 생성 없이 direct 값 Qna_vo에 저장하기
			Cud_vo cvo = (Cud_vo)req.getSession().getAttribute("vo");
			Qna_dao qdao = new Qna_dao();
			String qna_content = "";
			String id = "";
			int qna_deep = 1;
			int prod_code = 0;
			
			// 선언된 변수들에 파라미터로 받아 온 값 넘겨주기
			if (cvo != null) {
				id = cvo.getCud_id();
				if (id != "admin") {
					if (req.getParameter("qna_content") != null) {
						qna_content = req.getParameter("qna_content");
					}
				}
			}
			if (req.getParameter("prod_code") != null) {
				prod_code = Integer.parseInt(req.getParameter("prod_code"));
			}
			
			Qna_vo qvo = new Qna_vo();
			qvo.setQna_content(qna_content);
			qvo.setQna_deep(qna_deep);
			qvo.setProd_code(prod_code);
			
			if (qdao.insert_q(qvo, id)) {
				req.setAttribute("qvo", qvo);
			};
			
			RequestDispatcher prod_select_disp = req.getRequestDispatcher("prod_detail.prod");
			prod_select_disp.forward(req, resp);
			
		} else if (temp.indexOf("insert_a.prod") >= 0) {
			// setVo 생성 없이 direct 값 Qna_vo에 저장하기
			Cud_vo cvo = (Cud_vo)req.getSession().getAttribute("vo");
			Qna_dao qdao = new Qna_dao();
			String qna_content = "";
			String id = "";
			int q_seq = 0;
			int qna_deep = 2;
			int prod_code = 0;
			
			// 선언된 변수들에 파라미터로 받아 온 값 넘겨주기
			if (cvo != null) {
				id = cvo.getCud_id();
				if (id.equals("admin")) {
					qna_content = req.getParameter("qna_reply_textarea");
					q_seq = Integer.parseInt(req.getParameter("q_seq"));
				}
			}
			if (req.getParameter("prod_code") != null) {
				prod_code = Integer.parseInt(req.getParameter("prod_code"));
			}
			
			Qna_vo qvo = new Qna_vo();
			qvo.setQna_content(qna_content);
			qvo.setQna_deep(qna_deep);
			qvo.setProd_code(prod_code);
			
			if (qdao.insert_a(qvo, id, q_seq)) {
				req.setAttribute("qvo", qvo);
			};
			
			RequestDispatcher prod_select_disp = req.getRequestDispatcher("prod_detail.prod");
			prod_select_disp.forward(req, resp);
			
		} else if (temp.indexOf("delete_qna.prod") >= 0) {
			Cud_vo cvo = (Cud_vo)req.getSession().getAttribute("vo");
			Qna_dao qdao = new Qna_dao();
			String id = "";
			String pwd = "";
			String fail = "삭제 실패";
			int qna_code= 0;
			
			// 선언된 변수들에 파라미터로 받아 온 값 넘겨주기
			if (cvo != null) {
				id = cvo.getCud_id();
				pwd = cvo.getCud_pwd();
				if (req.getParameter("q_seq") != null) {
					qna_code = Integer.parseInt(req.getParameter("q_seq"));
				}
			}
				
			if (qdao.delete_qna(qna_code, id, pwd)) {
				
			} else { 
				req.setAttribute("fail", fail);
			}
				
			RequestDispatcher prod_select_disp = req.getRequestDispatcher("prod_detail.prod");
			prod_select_disp.forward(req, resp);
		}
	}
	
}
