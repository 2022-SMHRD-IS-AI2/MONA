package com.smhrd.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.UserDAO;
import com.smhrd.model.UserVO;


public class LoginCon extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	    request.setCharacterEncoding("UTF-8");
	    
		String id=request.getParameter("id");
		String pw=request.getParameter("pw");
		
		//System.out.println(id + " " + pw);
		
		//데이터베이스에 한번에 값 넣어주기
		UserVO vo = new UserVO(id, pw);
		
		//System.out.println(vo);
		
		
		Map<String, Object> loginUser =new UserDAO().selectUser(vo);
		                         
		//System.out.println(loginUser);
		
		if( loginUser!=null) {//로그인 성공
			System.out.println("로그인 성공");
			
			String id1 = (String) loginUser.get("U_ID");
			String pw1 = (String) loginUser.get("U_PW");
			
			//System.out.println("id1 " + id1);
			
			HttpSession session = request.getSession();
			session.setAttribute("loginUser_id", (String) loginUser.get("U_ID"));
			session.setAttribute("loginUser_pw", pw1);
			response.sendRedirect("main.jsp");
		
		}else {//로그인 실패
			System.out.println("로그인 실패");
			response.sendRedirect("login.jsp");
		}
	}

}
