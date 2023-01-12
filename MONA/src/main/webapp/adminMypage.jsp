<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.smhrd.model.ProductDAO"%>
<%@page import="com.smhrd.model.ProductVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <link rel="stylesheet" href="./CSS/main.css">
   <link rel="stylesheet" href="./CSS/admin.css"> 
   <link rel="stylesheet" href="./CSS/usermypage.css"> 
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
</head>
<style>

</style>
<body>
 <% List<ProductVO> vo = (new ProductDAO()).showProduct(); %>  
       
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
                    <span>관리자</span>
                    <spacn>admin</span>
                </div>
                
                <div class="logininfo-order-product" >
                    <span>상품등록 요청은 총 </span>
                    <span><%=vo.size()%></span>
                    <span>건입니다</span>
                </div>
                <div class="logininfo-order-written">
                    <span>승인된 요청은 총 </span>
                    <span>0</span> 
                    <span>건입니다</span>
                </div>
                
            </div>
            <div class="logininfo-order">
                <div class="logininfo-order-number">
                    <span>상품등록 요청 건</span>
                    <i class="fa-solid fa-chevron-right fa-xs"></i>
                </div>
                <div class="logininfo-order-number">
                    <span><%=vo.size()%></span>
                    <span>건</span>
                </div>
            </div>
            <div class="logininfo-order">
                <div class="logininfo-order-review">
                    <span>승인된 요청 건</span>
                    <i class="fa-solid fa-chevron-right fa-xs"></i>
                </div>
                <div class="logininfo-order-review">
                    <span>0</span>
                    <span>건</span>
                </div>
            </div>

        </div>
       
        <%for(int i =0; i<vo.size(); i++){ %>
        <div class="ordercontents-date">
            <span><%=vo.get(i).getProd_regdt()%> </span>
        </div>
        
        <div class="ordercontents-list">
            <div class="ordercontents-list-img">
            <img  width="250px" height="150px" src="./prod/<%=vo.get(i).getProd_thumb()%>">
            </div>    
            
            <div class="managercontents-list-title">
            	<span>상호명</span>
                <span><%=vo.get(i).getShop_name()%></span>
                 </div> 
                 
                  <div class="managercontents-list-title">
            	<span>상품명</span>
                <span><%=vo.get(i).getProd_name()%></span>
                 </div>  
                 
                  <div class="managercontents-list-title">
            	<span>가격</span>
                <span><%=vo.get(i).getProd_price()%></span>
                 </div>  
                 
                  <div class="managercontents-list-reveiw">
                 <form action="adminCheckCon" method="post">
                  <input hidden name="adminCheck" value="<%=vo.get(i).getProd_num()%>">
                  <input hidden name="prod_cate" value="<%=vo.get(i).getProd_cate()%>"> 
                  <input type="submit" value="승인">
                  </form>     
   
                  <form action="#">
                  <input type="submit" value="거부">
                  </form> 
                   
            </div>
        </div>
  		<%}%> 
    
    </div>
        
</div>

</body>
</html>