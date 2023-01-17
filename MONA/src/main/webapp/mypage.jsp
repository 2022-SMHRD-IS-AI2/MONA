<%@page import="com.smhrd.model.ProductVO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.ProductDAO"%>
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

<%
     String loginUser = (String) session.getAttribute("loginUser_id");
     String U_id = (String) session.getAttribute("loginUser_id");
   
     List<ProductVO> vo = new ProductDAO().showOrder(U_id);   

   %>
</head>
<body>
  <div class="header">
        <div class="header-logo">
   
            <a href="main.jsp"><h2>MonA</h2></a>
    <div class="header-serch" >
            <input type="text" name="" id="">
            
        </div>
        <a href=""><i class="fa-solid fa-magnifying-glass"></i></a>
        </div>
    
        <div class="header-menu" >
            <a href="Bucket.jsp"><i class="fa-solid fa-cart-shopping"></i></a> 
       			 
               
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
    
    <!--마이페이지 시작  -->
     <div class="mypage-container">
        <div class="logininfo">
            <div class="logininfo-order">
                <div class="logininfo-order-h2">
                    <span><%=loginUser%></span>
                    <span> 님 환영합니다</span>
                </div>
                
                <div class="logininfo-order-product" >
                    <span>주문한 상품은 총 </span>
                    <span><%=vo.size()%>건</span>
                    <span>입니다</span>
                </div>
                <div class="logininfo-order-written">
                    <span>작성한 리뷰는 총 </span>
                    <span>0건</span> 
                    <span>입니다</span>
                </div>
                
            </div>
            <div class="logininfo-order">
                <div class="logininfo-order-number">
                    <span>주문건수</span>
                    <i class="fa-solid fa-chevron-right fa-xs"></i>
                </div>
                <div class="logininfo-order-number">
                    <span><%=vo.size()%></span>
                    <span>건</span>
                </div>
            </div>
            <div class="logininfo-order">
                <div class="logininfo-order-review">
                    <span>작성한 리뷰 건수</span>
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
        
        <!-- 반복문 시작 -->  
       
       <%for(int i=0; i<vo.size(); i++) {%>
        <div class="ordercontents-date">
            <span><h4><%=vo.get(i).getProd_regdt()%></h4></span>
        </div>
        <div class="ordercontents-list">
            <div class="ordercontents-list-img">
                 <img width="250px" height="200px" src="./prod/<%=vo.get(i).getProd_thumb()%>">     
            </div>    
            <div class="ordercontents-list-title">
                <span><%=vo.get(i).getShop_name()%></span>
                <span><%=vo.get(i).getProd_name()%></span>
                 <span><%=vo.get(i).getProd_price()%></span>
            </div>       
            
            <div class="ordercontents-list-quantity">
                <span>수량:</span>
                <span><%=vo.get(i).getCnt() %></span>
            </div>
            <div class="ordercontents-list-state">
                <span >주문상태</span>
                <button type="submit">결제확정</button>
            </div>
            
            <div class="ordercontents-list-reveiw">
                <a href=""><span >리뷰작성하기</span></a>
            </div>
        </div>
  	<%} %>
  
   
    
    
    </div>
     <div class="footer">
    </div> 
    

</div>

 


    
</body>
</html>