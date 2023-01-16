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
		String loginUser = (String) session.getAttribute("loginUser_id");

		String content = request.getParameter("");
		int reviewRating = Integer.parseInt(request.getParameter(""));

		ReviewVO vo = new ReviewVO(content, loginUser, reviewRating);

		int cnt = new ReviewDAO().reviewUpload(vo);

		if (cnt > 0) {
			System.out.println("업로드 성공");
		} else {
			System.out.println("업로드 실패");
		}
		
		response.sendRedirect("상세페이지 경로");
	}

}
