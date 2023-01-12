package com.smhrd.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.model.BoardDAO;
import com.smhrd.model.BoardVO;


public class WriterBoardCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// post방식 인코딩
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
        String loginUser = (String) session.getAttribute("loginUser_id");
        
        System.out.println(loginUser);
		
		// MultipartRequest에서 필요한 매개변수 설정
		// 1. 모든 요청의 정보가 담겨있는 request객체
		// 2. 업로든 된 파일(이미지)을 저장할 경로
		String path = request.getServletContext().getRealPath("./file");
		System.out.println(path);
		// 3. 파일의 max size
		int maxSize = 10*1024*1024;
		
		// 4. 인코딩 방식
		String encoding ="UTF-8";
		
		// 5. 중복제거
		DefaultFileRenamePolicy rename =new DefaultFileRenamePolicy();
		
		// 파일 업로드 ->MultipartReauest ->cos.jar
		MultipartRequest multi = new MultipartRequest(request, path, maxSize, encoding, rename);
	
		// DB에 저장하기 위해서 게시글 정보 가져오기
	
		// 한글이름은 인코딩해야 나중에 이미지 확인 가능!
		// URLEncoder.encode(인코딩할 값, 인코딩 방식)
		// Integer.parseInt(형변화할값)
		String title = multi.getParameter("title");
		String file = URLEncoder.encode(multi.getFilesystemName("filename"),"UTF-8");
		String content = multi.getParameter("content");
	
		System.out.println("title :"+ title);
		System.out.println("file :"+ file);
		System.out.println("content :"+ content);
	
		// vo로 묶기
		BoardVO vo = new BoardVO(title,content,file,loginUser);
		
		int cnt = new BoardDAO().upload2(vo);
		
		if (cnt>0) {
			System.out.println("업로드 성공");
		}else {
			System.out.println("업로드 실패");
		}
	
		response.sendRedirect("boardMain.jsp");
	}

}
