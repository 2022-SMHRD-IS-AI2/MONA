package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.OrderDAO;
import com.smhrd.model.OrderVO;
import com.smhrd.model.ProductDAO;
import com.smhrd.model.ProductVO;


public class orderCon extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
	  	String u_id = (String) session.getAttribute("loginUser_id");
	  	
		String price=request.getParameter("price");
		String prod_name =request.getParameter("prod_name");
		String b=request.getParameter("b");
		
		int paid_amount=Integer.parseInt(price);
		int cnt=Integer.parseInt(b);
		
//		System.out.println("상품이름"+prod_name);
//		System.out.println("결제금액"+paid_amount);
//		System.out.println("상품수량"+prod_cnt);
//		System.out.println("주문자 아이디"+u_id);
		

		OrderVO vo= new OrderVO(u_id,paid_amount,cnt,prod_name); 
		
		int o_cnt = new OrderDAO().orderUpload(vo);
		
		
		if(o_cnt>0) {
			System.out.println("주문 내역 업로드 성공");
			response.sendRedirect("pay.jsp");
		}else {
			System.out.println("주문 내역 업로드 실패");
			response.sendRedirect("Bucket.jsp");
		}
	
		
		
		
		
	}

}
