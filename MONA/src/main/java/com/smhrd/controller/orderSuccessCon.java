package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.BucketDAO;
import com.smhrd.model.OrderDAO;


public class orderSuccessCon extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		String loginUser = (String) session.getAttribute("loginUser_id");
		System.out.println(loginUser);
		
		int B_cnt = new BucketDAO().B_Check(loginUser);
		int O_cnt = new OrderDAO().orderCheck(loginUser);
		
		System.out.println(B_cnt);
		System.out.println(O_cnt);
		
		if(O_cnt>0 && B_cnt>0) {
			System.out.println("주문완료");
			response.sendRedirect("completePayment.jsp");
		}else {
			System.out.println("주문실패");
			
		}
	
		
	}

}
