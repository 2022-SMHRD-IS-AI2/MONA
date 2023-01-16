package com.smhrd.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.RequestDispatcher;
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
        String U_id = (String) session.getAttribute("loginUser_id");
        
     
		
	    String Prod_num = request.getParameter("prod_num");
	    int prod_num=Integer.parseInt(Prod_num);
	    
	    String Cnt= request.getParameter("cnt");
	    int cnt =Integer.parseInt(Cnt);
	    System.out.println("여기"+cnt);
		
		BucketVO vo = new BucketVO(prod_num,U_id,cnt);	
		int cnt1 = new BucketDAO().Bupload(vo);
		
		
		
		if (cnt1> 0) {
			System.out.println("장바구니 업로드 성공");
		}else {
		System.out.println("장바구니 업로드 실패");
		}
		
//		 String test = "/productDetail.jsp?prod_num="+prod_num;
//
//		 RequestDispatcher rd;
//		 rd = getServletContext().getRequestDispatcher(test);
//		
//		 rd.forward(request, response);
		
		response.sendRedirect("productDetail.jsp?prod_num="+prod_num);
		
	}

	
	
	
}
