package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.ReviewDAO;
import com.smhrd.model.ReviewVO;

public class ReviewCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String u_id = (String) session.getAttribute("loginUser_id");

		String review_content = request.getParameter("r_content");
		int reviewRating = Integer.parseInt(request.getParameter("rating"));
		int prod_num = Integer.parseInt(request.getParameter("prod_num"));
		
		System.out.println(u_id);
		System.out.println(review_content);
		System.out.println(reviewRating);
		System.out.println(prod_num);

		
		  ReviewVO vo = new ReviewVO(prod_num,review_content, u_id, reviewRating);
		  
		  int cnt = new ReviewDAO().reviewUpload(vo);
		  
		  if (cnt > 0) {
		  System.out.println("업로드 성공"); 
		  }else {
		  System.out.println("업로드 실패"); 
		  }
		  
		  response.sendRedirect("productDetail.jsp?prod_num="+prod_num);
		 
	}

}
