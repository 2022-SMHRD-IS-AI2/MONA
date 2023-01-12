package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.CommentDAO;
import com.smhrd.model.CommentVO;

public class CommentCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		int b_num = Integer.parseInt(request.getParameter("b_num"));
		System.out.println("cmtnum" +"="+ b_num);

		HttpSession session = request.getSession();
		String loginUser = (String) session.getAttribute("loginUser_id");
		System.out.println(loginUser);

		String comment = request.getParameter("commentText");
		System.out.println(comment);

		CommentVO vo = new CommentVO(b_num, comment, loginUser);
		int cnt = new CommentDAO().insertCmt(vo);
		
		if (cnt > 0) {
			System.out.println("댓글 성공");
		} else {
			System.out.println("댓글 실패");
		}

		response.sendRedirect("boardDetail2.jsp?b_num="+b_num);
		
	}

}

