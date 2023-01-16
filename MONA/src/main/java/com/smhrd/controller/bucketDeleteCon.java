package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.BucketDAO;


public class bucketDeleteCon extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String loginUser = request.getParameter("loginUSer");
		System.out.println(loginUser);
		
		int B_cnt = new BucketDAO().Bdelete(loginUser);
		
		if(B_cnt>0) {
			System.out.println("장바구니 상품 삭제 성공");
			response.sendRedirect("Bucket.jsp");
		}else {
			System.out.println("장바구니 상품 삭제 실패");
			response.sendRedirect("Bucket.jsp");
			
		}
	}

}
