<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
     
      <link rel="stylesheet" href="./CSS/main.css">
      <link rel="stylesheet" href="./CSS/style.css">
</head>
<body>
         
        <div class="header">   
        <div class="header-logo">
            <a href="main.jsp">MonA</a>
        </div>
        <div class="header-serch" >
            <input type="text" name="" id="">
            <a href=""><i class="fa-solid fa-magnifying-glass"></i></a>
        </div>
        <div class="header-menu" >
            <a href="#"><i class="fa-solid fa-cart-shopping"></i></a> 
            <a href="/boad.html">마이페이지</a>
            <a href="#">게시판</a>
            <a href="#">로그인</a>
            <a href="#">회원가입</a>
        </div>
    </div>
    <div class="header2">   
        <a href="">ALL</a>
        <a href="">식품</a>
        <a href="">의류</a>
        <a href="">장난감</a>
        <a href="">굿즈</a>
    </div>
	
    <div class="board_wrap">
    <form action ="WriterBoardCon" method="post" enctype="multipart/form-data">
        <div class="board_title">
            <strong>글쓰기</strong>
            <p>공지사항을 빠르고 정확하게 안내해드립니다.</p>
        </div>
        <div class="board_write_wrap">
            <div class="board_write">
                <div class="title">
                    <dl>
                        <dt>제목</dt>
                        <dd><input type="text" placeholder="제목 입력" name="title"></dd>
                    </dl>
                </div>
                <div class="info">
                    <dl>
                        <dt>ID</dt>
                        <dd>로그인된  ID</dd>
                    </dl>
                    <dl>
                        <dt>사진첨부</dt>
                        <dd><input  type="file" style="float: right;" name="filename"></dd>
                    </dl>
                    
                </div>
                <div class="cont">
                    <textarea name="content" placeholder="내용 입력"></textarea>
                </div>
            </div>
            <div class="bt_wrap">
                <input class="bt_wrap-input"  type="submit" value="등록">
           		
                <a href="boardMain.jsp">취소</a>
            </div>
            </form>
        
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