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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
</head>

<%
     String loginUser = (String) session.getAttribute("loginUser_id");
   
int b =0; 


if(loginUser != null){
	   String u_id= (String) session.getAttribute("loginUser_id");
		List<ProductVO> vo2 = new ProductDAO().showBk(u_id);
	   b=vo2.size();
}
   

   %>

<body>
  <div class="header">
        <div class="header-logo">
   
            <a href="main.jsp"><h2>MonA</h2></a>
    <form class="header-serch" >
            <input type="text" name="" id="">
            <a href=""><i class="fa-solid fa-magnifying-glass"></i></a>	
        </form>
        
        </div>
    
        <div class="header-menu" >
            <a href="Bucket.jsp"><i class="fa-solid fa-cart-shopping"></i></a> 
       		<%=b %>
               
         <%if(loginUser == null){%>
               <!--로그인 안했을 경우  -->
             <a href="join.jsp">회원가입</a>  
            <a href="login.jsp">로그인</a>
        
         <% }else {%>
            <% // 관리자가 로그인 했을 때 이용자(소비자,판매자)마이페이지가 아닌 관리자 마이페이지로 이동
            if(loginUser.equals("admin")){%>
                 <a href="adminMypage.jsp">마이페이지</a>
            <%}else {%>
             <!--관리자가 아닌 유저(소비자,판매자)가 로그인 성공 시 이용자 전용 마이페이지로 이동 -->
             <a href="mypage.jsp">마이페이지</a>
            <%}%> 
            
             <a href="boardMain.jsp">게시판</a>
             <a href="LogoutCon">로그아웃</a>
             <a href="#"><%=loginUser%>님  환영합니다</a>   
         <%} %>
            
                     
        </div>
    </div>
    <div class="header2">   
        <a href="food.jsp"><h3>Food</h3></a>
        <a href="clothes.jsp"><h3>Clothes</h3></a>
        <a href="toy.jsp"><h3>Toy</h3></a>
        <a href="goods.jsp"><h3>Goods</h3></a>
    </div>
    
    <!--리뷰페이지 시작 -->
    <div class="midpart">
    <div class="midpart_title">
        <strong>리뷰 작성</strong>
        <p>좋은 리뷰써주세요.</p>
    </div>

    <div class="midpart_image">
        <a href="#">
            <img src="/img/반려동물식품/강아지 수제간식 소우신 우스틱 소떡심 폭스펫 피즐스틱.jpg" alt="">

         </a> 
        <div class="product-imfor">
            <div class="product-imfor1">상호 :</div>
            <div class="product-imfor1">상품명 :</div>
             <div class="product-imfor1">가격 :</div>
             <div class="realstarstar">
                <form name="myform" id="myform" method="post" action="./save">
                    <fieldset>
                        <legend>별점</legend>
                        <input type="radio" name="rating" value="5" id="rate1"><label for="rate1">⭐</label>
                        <input type="radio" name="rating" value="4" id="rate2"><label for="rate2">⭐</label>
                    <input type="radio" name="rating" value="3" id="rate3"><label for="rate3">⭐</label>
                    <input type="radio" name="rating" value="2" id="rate4"><label for="rate4">⭐</label>
                    <input type="radio" name="rating" value="1" id="rate5"><label for="rate5">⭐</label>
                    </fieldset>
                </form>
            </div>    
        </div>  
    </div>

    <!-- 별점! ! ! -->

    <div class="contrv">
    <textarea placeholder="리뷰 작성해주세요."></textarea>
    </div>
    <div class="bt_wraprv">
        <input type="submit" value="등록">
    </div>


</div>
    <div class="footer">
    </div>
</body>
</html>