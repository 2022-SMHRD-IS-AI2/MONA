<%@page import="com.smhrd.model.ProductDAO"%>
<%@page import="com.smhrd.model.ProductVO"%>
<%@page import="com.smhrd.model.BoardVO"%>
<%@page import="com.smhrd.model.BoardDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="./CSS/css.css">
<link rel="stylesheet" href="./CSS/main.css">
</head>
<body>

   <div class="header">
      <div class="header-logo">
         <a href="main.jsp">MonA</a>
      </div>
      <div class="header-serch">
         <input type="text" name="" id=""> <a href=""><i
            class="fa-solid fa-magnifying-glass"></i></a>
      </div>
      <div class="header-menu">
         <a href="#"><i class="fa-solid fa-cart-shopping"></i></a> <a
            href="/boad.html">마이페이지</a> <a href="#">게시판</a> <a href="#">로그인</a>
         <a href="#">회원가입</a>
      </div>
   </div>
   <div class="header2">
      <a href="">ALL</a> <a href="">식품</a> <a href="">의류</a> <a href="">장난감</a>
      <a href="">굿즈</a>
   </div>

   <div class="board_wrap">
      <div class="board_title">
         <strong>게시판</strong>
         <p>* 묻고 답하고 소통하는 공간 *</p>
      </div>
      <div class="board_list_wrap">
         <div class="board_list">
            <div class="top">
               <div class="num">번호</div>
               <div class="title">제목</div>
               <div class="writer">작성자</div>
               <div class="date">작성일</div>
               <div class="count">조회</div>
            </div>
            
            <% List<BoardVO> vo = (new BoardDAO()).showBoard(); %>
            
            <%for(int i =0; i< vo.size();i++){ %>
            <div>
               <div class="num"><%=i+1 %></div>
               <div class="title">
                  <a href="boardDetail2.jsp?b_num=<%=vo.get(i).getNum() %>"><%=vo.get(i).getTitle() %></a>
               </div>
               <div class="writer"><%=vo.get(i).getId() %></div>
               <div class="date"><%=vo.get(i).getRegdt().toString() %></div>
            </div>
            <%} %>
         
         <div class="bt_wrap">
            <a href="main.jsp" clss="on">홈으로가기</a>
            <a href="boardWrite2.jsp" class="on">등록</a>
            <!--<a href="#">수정</a>-->
         </div>
   


</body>
</html>