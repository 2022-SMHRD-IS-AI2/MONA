package com.smhrd.controller;

import java.io.IOException;
import java.lang.reflect.Member;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.UserDAO;
import com.smhrd.model.UserVO;

public class JoinCon extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void service(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      request.setCharacterEncoding("UTF-8");

      String id = request.getParameter("id");
      String pw = request.getParameter("pw");
      String name = request.getParameter("name");
      String nick = request.getParameter("nick");
      String tel = request.getParameter("tel");
      String address = request.getParameter("address");

		/* 데이터값 들어오는지 확인! */
       //System.out.println(id + ", " + pw + "," +name+"," +nick+"," + tel + ", " +
       //address);
       
      // 데이터베이스에 한번에 값 넣어주기
      UserVO vo = new UserVO(id, pw, name, nick,address, tel);
      
      UserDAO dao = new UserDAO();
      int cnt = dao.insertUser(vo);
      
      if (cnt > 0) {
         System.out.println("회원가입 성공");
         // 포워딩 방식 main.jsp로 이동, id -> request 영역에 저장
         RequestDispatcher rd = request.getRequestDispatcher("main.jsp");
         request.setAttribute("id",id );
         rd.forward(request, response);
      }else {
         System.out.println("회원가입 실패");
         response.sendRedirect("main.jsp");
      }
      
      
      
   }

}
