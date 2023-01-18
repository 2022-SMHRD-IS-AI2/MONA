package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.BucketDAO;
import com.smhrd.model.BucketVO;
import com.smhrd.model.CommentVO;
import com.smhrd.model.OrderDAO;


public class orderUpdateCon extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String prodNum=request.getParameter("prod_num");
		int prod_num=Integer.parseInt(prodNum);
		
		int pcnt = Integer.parseInt(request.getParameter("pcnt"));
		System.out.println(pcnt);
		
		HttpSession session = request.getSession();
		String u_id = (String)session.getAttribute("loginUser_id");
		int c =0;
		
		BucketVO vo = new BucketVO(prod_num,u_id,c);
		int cnt = new BucketDAO().orderUpdate(vo);
		
		BucketVO pvo = new BucketVO(prod_num, pcnt);
		int tcnt = new BucketDAO().cntUpdate(pvo);
		
		if(cnt>0) {
			System.out.println("결제 확정 성공");
			response.sendRedirect("mypage.jsp");
		}else {
			System.out.println("결제 확정 실패");
			response.sendRedirect("mypage.jsp");
		}
	
		if (tcnt> 0) {
			System.out.println("판매 누적 성공");
		}else {
		System.out.println("판매 누적 실패");
		}
		
	}

}
