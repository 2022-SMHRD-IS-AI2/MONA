 <%@page import="com.smhrd.model.CommentDAO"%>
<%@page import="com.smhrd.model.CommentVO"%>
<%@page import="com.smhrd.model.BoardVO"%>
<%@page import="com.smhrd.model.BoardDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" href="./CSS/css.css">
<link rel="stylesheet" href="./CSS/main.css">
<head>
<title>Forty by HTML5 UP</title>
<meta charset="utf-8" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="assetsBoard/css/main.css" />
<link rel="stylesheet" href="assetsBoard/css/board.css" />
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->

</head>
<body>

   <%
   int b_num = Integer.parseInt(request.getParameter("b_num"));
   BoardVO vo = new BoardDAO().detailBoard(b_num);
   %>

   <%
   CommentVO cvo = new CommentVO(b_num);
   List<CommentVO> lvo = new CommentDAO().showCmt(cvo);
   %>

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
      <div class="board_view_wrap">
         <div class="board_view">
            <div class="title">
               <%=vo.getTitle()%>
            </div>
            <div class="info">
               <dl>
                  <dt>번호</dt>
                  <dd>1</dd>
               </dl>
               <dl>
                  <dt>작성자</dt>
                  <dd><%=vo.getId()%></dd>
               </dl>
               <dl>
                  <dt>작성일</dt>
                  <dd><%=vo.getRegdt().toString()%></dd>
               </dl>

            </div>
            <div class="cont">
               <%=vo.getContent()%>
               <br> <img src="./file/<%=vo.getFile()%>">
            </div>
         </div>

         
      <%
         for (int j = 0; j < lvo.size(); j++) {
         %>
      
         <div class="board_view_ripple">
            <%
         for (int i = j; i <= j; i++) {
         %>
            <span><%=lvo.get(j).getU_Id()%>
            </span>
            <%
         }
         %>
         <%
         for (int i = j; i <= j; i++) {
         %>
            <div class="board_view_ripplecoment">
               <p><%=lvo.get(j).getCMT_CONTENT()%></p>
               <p><%=lvo.get(j).getCMT_REGDT()%></p>
            </div>
            
            <%
         }
         %>
         </div>

         <%
         }
         %>
      
         <!--댓글 -->

         <div class="board_view_comment">
            <div class="board_view_commtitle">
               <h3>댓글</h3>
            </div>

            <form class="board_view_commform" method="post" action="CommentCon">
               <input hidden name="b_num" value="<%=b_num%>">
               <div class="board_view_comminput">
                  <input type="text" ; placeholder="댓글을 입력하세요!" name="commentText">
               </div>
               <div class="board_view_commsubmit">
                  <input type="submit" value="등록">
               </div>
            </form>

         </div>

         <div class="bt_wrap">
            <a href="boardMain.jsp" class="on">목록</a>
            <!-- <a href="edit.html">수정</a> -->
         </div>
      </div>

      <!-- Scripts -->
      <script src="assets/js/jquery.min.js"></script>
      <script src="assets/js/jquery.scrolly.min.js"></script>
      <script src="assets/js/jquery.scrollex.min.js"></script>
      <script src="assets/js/skel.min.js"></script>
      <script src="assets/js/util.js"></script>
      <!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
      <script src="assets/js/main.js"></script>
</body>
</html>