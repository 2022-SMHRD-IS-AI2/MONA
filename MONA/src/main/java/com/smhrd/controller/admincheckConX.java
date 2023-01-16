package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.ProductDAO;

public class admincheckConX extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		int prod_num2 = Integer.parseInt(request.getParameter("adminCheck2"));

		System.out.println(prod_num2);

		ProductDAO dao2 = new ProductDAO();
		int cnt2 = dao2.updateAdminCheck2(prod_num2);

		if (cnt2 > 0) {
			System.out.println("승인여부 업데이트 성공");
			response.sendRedirect("adminMypage.jsp");
		} else {
			System.out.println("승인여부 업데이트 실패");
			response.sendRedirect("adminMypage");

		}

	}

}
