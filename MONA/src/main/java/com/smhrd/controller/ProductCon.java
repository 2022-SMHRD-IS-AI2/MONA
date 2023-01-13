package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.model.ProductDAO;
import com.smhrd.model.ProductVO;


public class ProductCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("UTF-8");
		

		HttpSession session = request.getSession();
	  	String sellerId = (String) session.getAttribute("loginUser_id");
	  	
	  	System.out.println(sellerId);
		
		// MultipartRequest에서 필요한 매개변수 설정
		// 1.모든 요청의 청보가 담겨있는 request객체
		// 2.업로드 된 파일(이미지)을 저장할 경로
		String path =request.getServletContext().getRealPath("./prod");
		System.out.println(path);
		System.out.println(request.getContextPath());
		System.out.println(request.getServletPath());
		
		
		// 3.파일의 max size
		int maxSize = 10*1024*1024;
		
		// 4.인코딩 방식
		String encoding = "UTF-8";
		
		// 5. 중복제거
		 DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();
		
		 
		//파일 업로드 -> MultiPartRequest -> cos.jar
		MultipartRequest multi = new MultipartRequest(request, path, maxSize,encoding,rename);
		
				
		
		//DB에 저장하기 위해서 등록한 상품정보 가져오기
	    String shop_Name=multi.getParameter("shopName"); 	//상호명
		String prod_Name=multi.getParameter("prodName"); 	//상품명
		String prod_Cate=multi.getParameter("prodCate");	//상품 카테고리
		String price= multi.getParameter("prodPrice"); 	    //상품가격
		int prod_Price=Integer.parseInt(price);
		String prod_Thumb= multi.getFilesystemName("prodThumb");	//썸네일
		String prod_Img= multi.getFilesystemName("prodImg");		//이미지(제작과정 이미지 파일?)
		String prod_Desc= multi.getParameter("prodDesc");    //상품설명
		
//		System.out.println(shop_Name);
//		System.out.println(prod_Name);
//		System.out.println(prod_Cate);
//		System.out.println(prod_Price);
//		System.out.println(prod_Thumb);
//		System.out.println(prod_Img);
//		System.out.println(shop_Name);
//		System.out.println(prod_Desc);
		

		ProductVO vo= new ProductVO(prod_Name,prod_Cate,prod_Price,prod_Thumb,prod_Img,prod_Desc,sellerId,shop_Name); 
		
		int cnt = new ProductDAO().upload(vo);
		
		if(cnt>0) {
			System.out.println("업로드 성공");
		}else {
			System.out.println("업로드 실패");
		}
		response.sendRedirect("main.jsp");
	}
	
	
	
	

}


