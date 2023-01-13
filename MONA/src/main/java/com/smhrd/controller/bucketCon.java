package com.smhrd.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.model.BucketDAO;
import com.smhrd.model.BucketVO;


public class bucketCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
        String loginUser = (String) session.getAttribute("loginUser_id");
        
        System.out.println(loginUser);
		
		//String Prod_num = request.getParameter("PROD_NUM");
		//System.out.println(Prod_num);
		
		//BucketVO vo = new BucketVO(Prod_num,U_ID);	
		
		//List<BucketVO> cnt = new BucketDAO().showBk(vo);
		
		//if (cnt.size() > 0) {
		//	System.out.println("장바구니 내역이 없습니다");
		//}else {
		//	System.out.println("장바구니 내역 성공");
		//}
	
		//response.sendRedirect("Bucket.jsp");
	}

	
	
	
}
