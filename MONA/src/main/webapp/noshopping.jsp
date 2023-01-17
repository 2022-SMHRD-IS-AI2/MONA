<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="./CSS/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
    <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
    
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
    <div class="shoppingBag">
        <div class="cartBag">
            <div class="cartBag-header">
                <h2>장바구니</h2>
                
            </div>
        
        </div> 
        <div class="noshopping-item">
            <div class="noshopping">
                <i class="fa-solid fa-cart-shopping fa-6x"></i>
                
                
                
            </div>
            <p class="noshopping-p">
                장바구니가 비었습니다.
                <br>작가님들의 다양한 작품을 담아보세요.
            </p>
            <button>
                <a href="/index.html">상품 구경하러 가기</a>     
            </button>
        



        </div>


    </div>
   

    <script src="/js/shopping.js"></script>
</body>
</html>