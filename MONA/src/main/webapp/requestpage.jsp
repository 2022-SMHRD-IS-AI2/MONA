<%@page import="com.smhrd.model.ReviewDAO"%>
<%@page import="com.smhrd.model.ReviewVO"%>
<%@page import="com.smhrd.model.CommentVO"%>
<%@page import="com.smhrd.model.RequestDAO"%>
<%@page import="com.smhrd.model.RequestVO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.ProductDAO"%>
<%@page import="com.smhrd.model.ProductVO"%>

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
 <%
  	String loginUser = (String) session.getAttribute("loginUser_id");
	
 int b =0; 


 if(loginUser != null){
 	   String u_id= (String) session.getAttribute("loginUser_id");
 		List<ProductVO> vo2 = new ProductDAO().showBk(u_id);
 	   b=vo2.size();
 }
	

	%>
	
	<%
   int prod_num = Integer.parseInt(request.getParameter("prod_num"));
   ProductVO vo = new ProductDAO().showProdDetail(prod_num);
   
   RequestVO rvo = new RequestVO(prod_num);
   List<RequestVO> lvo = new RequestDAO().showRequest(rvo);
   %>
   
   
   <%
   ReviewVO vvo = new ReviewVO(prod_num); 
   List<ReviewVO> r_vo = new ReviewDAO().showReview(vvo);

   %>
   
    <script>
      $( document ).ready( function() {     
        $( '#quantity' ).change( function() {
          let a = $( '#quantity' ).val();
          let ab = (a * <%=vo.getProd_price()%>) + " 원";
          $( '#totalPrice' ).text( ab );
        } );
      } );
    </script>
    
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
    
    
    <div class="productdetail">
    <td><%=vo.getShop_name()%></td></br>
     <td><%=vo.getProd_name()%></td></br>
      가격<td><%=vo.getProd_price()%></td>
        <div class="productdetail-content">
            <img src="./prod/<%=vo.getProd_thumb()%>" alt="">
           
            상품설명
            <div><img src="./prod/<%=vo.getProd_img()%>" alt=""></div>
            
            <div class="ProductDetailDescription__textItem1">
                <span>
                <%=vo.getProd_desc()%> 
                </span>
            </div>

            
  
            
        
        </div>
        
     
     </div> 
     
    </div>
    
	<div class="footer">
    </div>
    <script src="./JS/productdetail.js"></script>
            
</body>
</html>