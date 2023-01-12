<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./CSS/css.css">
<link rel="stylesheet" href="./CSS/main.css">
</head>

<body>

<div class="header">   
        <div class="header-logo">
            <a href="index.html">MonA</a>
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
        <div class="board_title">
            <strong>게시판</strong>
            <p>* 묻고 답하고 소통하는 공간 *</p>
        </div>
        <div class="board_view_wrap">
            <div class="board_view">
                <div class="title">
                    이 간식 먹여도 되나요??
                </div>
                <div class="info">
                    <dl>
                        <dt>번호</dt>
                        <dd>1</dd>
                    </dl>
                    <dl>
                        <dt>작성자</dt>
                        <dd>비숑 토리언니</dd>
                    </dl>
                    <dl>
                        <dt>작성일</dt>
                        <dd>2022.12.28</dd>
                    </dl>
                    <dl>
                        <dt>조회</dt>
                        <dd>33</dd>
                    </dl>
                </div>
                <div class="cont">
                    그 비숑 프리제 모임이 있는데 제가 이벤트에 당첨이 되어서 간식과 사료를 받았어요!
                    그런데 간식이 7세 이상이라고 적혀있네요... 저의 아가는 막 4개월이거든요ㅠㅠ 
                    먹여도 될까요? 아니면 7세까지 기다려야하는건가요??
                    <br>
                    <img src="/img/qw.jpg" style="width:500px; height:500px;">
                    <img src="/img/qwe.jpg" style="width:500px; height:500px;">
                </div>
            </div> <br><br>

<!-- 댓글!!!!!!! -->
            <div class="board_view_comment">
                <div class="board_view_commtitle">
                    <h3>댓글</h3>
                </div>
                <div class="board_view_comminput">
                    <input type="text"; placeholder="댓글을 입력하세요!">
                </div>
                <div class="board_view_commsubmit">
                        <input  type="submit" value="등록">
                </div>
                
            </div>
<!-- 댓글!!!!!!!!! -->
    
            <div class="bt_wrap">
                <a href="list.html" class="on">목록</a>
                <!-- <a href="edit.html">수정</a> -->
            </div>
        </div>
    </div>



</body>
</html>