<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <title>게시판</title>
    <link rel="stylesheet" href="./CSS/main.css">
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
            <a href="#">마이페이지</a>
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
    <div class="boad-title">
        <h1 >상품 등록</h1>
    </div>
    
    
    <div class="boad">
        
        <form class="boad-content1" action="ProductCon" method="post"  enctype="multipart/form-data" >
            <div class="boad-content1-input1" >
                <span class="boad-content1-span">상호명</span>
                <input type="text" name="shopName">
            </div>
            <div class="boad-content1-input1" >
            <span class="boad-content1-span">상품 카테고리</span>
                <select class="boad-content1-select" name ="prodCate" >
            <option>식품</option>
            <option>의류</option>
            <option>장난감</option>
            <option>굿즈</option>
            </select>

            </div>         
            <div class="boad-content1-input1">
                <span class="boad-content1-span">상품명</span>
                <input type="text" name="prodName">
            </div>
            <div class="boad-content1-input1"> 
                <span class="boad-content1-span">상품 가격</span>
                <input type="text" name="prodPrice">
            </div>
            <div class="boad-content1-input1"> 
                <span class="boad-content1-span">상품 대표 사진</span>
                 <input type="file" name="prodThumb">
                </div>
            <div class="boad-content1-input1"> 
                <span class="boad-content1-span">상품 이미지</span>
                <input type="file" name="prodImg">
            </div>
            <div class="boad-content1-input2"> 
                <span class="boad-content1-span">상품 설명</span>
                <textarea cols="30" rows="20" style="resize: none;" name="prodDesc"></textarea>
            </div>
            <div class="boad-content1-submit">
                <input type="submit" value="상품등록">
            </div>
            

        </form>
    </div>
    <script ></script>
</body>
</html>