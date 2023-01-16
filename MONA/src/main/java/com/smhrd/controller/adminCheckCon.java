package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.ProductDAO;
import com.smhrd.model.ProductVO;


public class adminCheckCon extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
    request.setCharacterEncoding("UTF-8");
    
	int prod_num = Integer.parseInt(request.getParameter("adminCheck"));

	System.out.println(prod_num);


	ProductDAO dao = new ProductDAO();
	int cnt =dao.updateAdminCheck(prod_num);
	
	
	if(cnt>0) {     
		System.out.println("승인여부 업데이트 성공");
		response.sendRedirect("adminMypage.jsp");
	}else {
		System.out.println("승인여부 업데이트 실패");
		response.sendRedirect("adminMypage.jsp");
	}
		
	
	}

}
