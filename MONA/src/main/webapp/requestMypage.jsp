<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./CSS/main.css">
<link rel="stylesheet" href="./CSS/mypage.css">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
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
    <div class="mypage-container">
        <div class="logininfo">
            <div class="logininfo-order">
                <div class="logininfo-order-h2">
                    <span>김준연</span>
                    <span> 님 환영합니다</span>
                </div>
                
                <div class="logininfo-order-product" >
                    <span>상품등록 요청은 총 </span>
                    <span>0</span>
                    <span>건입니다</span>
                </div>
                <div class="logininfo-order-written">
                    <span>승인된 상품은 총 </span>
                    <span>0</span> 
                    <span>건입니다</span>
                </div>
                
            </div>
            <div class="logininfo-order">
                <div class="logininfo-order-number">
                    <span>상품등록 요청건수</span>
                    <i class="fa-solid fa-chevron-right fa-xs"></i>
                </div>
                <div class="logininfo-order-number">
                    <span>0</span>
                    <span>건</span>
                </div>
            </div>
            <div class="logininfo-order">
                <div class="logininfo-order-review">
                    <span>승인된 요청건수</span>
                    <i class="fa-solid fa-chevron-right fa-xs"></i>
                </div>
                <div class="logininfo-order-review">
                    <span>0</span>
                    <span>건</span>
                </div>
            </div>

        </div>
        <div class="button">
            <a href="mypage.jsp"><button>주문내역</button></a>
            <a href="requestMypage.jsp"><button>상품등록 요청 내역</button></a>
            <a href="productMypage.jsp"><button>등록한상품내역</button></a> 
        </div>
        
        <div class="ordercontents-date">
            <span>2023-01-10            </span>
        </div>
        <div class="ordercontents-list">
            <div class="ordercontents-list-img">
                <img width="200px" height="150px" src="/img/반려동물식품/[천연껌]콜라겐가득 ☝🏻돼지귀슬라이스.jpg" alt="">
            </div>    
            <div class="ordercontents-list-title">
                <span>title</span>
                <span>[천연껌]콜라겐가득 ☝🏻돼지귀슬라이스.</span>
            </div>       
            <div class="requestcontents-list-state">
                <span >주문상태</span> 
            </div>
       
        </div>
  
    </div>        
</div>

</body>


</html>