<%@page import="com.smhrd.model.ReviewDAO"%>
<%@page import="com.smhrd.model.ReviewVO"%>
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
   
   
   List<ProductVO> vo = (new ProductDAO()).popularProduct();


   %>

<body>
  <div class="header">
        <div class="header-logo">
   
            <a href="main.jsp"><h2>MonA</h2></a>
    	
        
        </div>
    
        <div class="header-menu" >
        <form class="header-serch" >
            <input type="text" name="" id="">
            <a href=""><i class="fa-solid fa-magnifying-glass"></i></a>	
        </form>
            <a href="Bucket.jsp"><i class="fa-solid fa-cart-shopping fa-1x"></i></a> 
            <%=b%>
       		
               
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
    <div class="banner">
    
    
    </div>

   <div class="head-title1" >
    <h1>popular product</h1>
   </div>
   
       <div class="head-title-Enrollment"> 
       <button id="b"><a href="product.jsp"><p>상품등록</p></a></button> 
    </div>

        <div class="contents">
       
     
     <%

    int star = 0;
    int t_star=0;
    double t_star2 = 0;
    double t_star3=0;
    
    
    for(int i=0; i<12; i++){%>  
    
        <div class="contents-child">
            <div class="contents-child-img">
                <a href="productDetail.jsp?prod_num=<%=vo.get(i).getProd_num()%>">
                    <img src="./prod/<%=vo.get(i).getProd_thumb()%>" alt="">
                </a>
            </div>
            <div class="contents-child-title" >
                <span><%=vo.get(i).getShop_name()%></span>
                <a href="#"><span><%=vo.get(i).getProd_name()%></span></a>
                  <span>가격    <%=vo.get(i).getProd_price()%>   원</span>
            </div>
  	 		<%
   				 ReviewVO vvo = new ReviewVO(vo.get(i).getProd_num()); 
  				 List<ReviewVO> r_vo = new ReviewDAO().showReview1(vvo);
  				 
			%>  		
   			<div class="contents-child-star">
  	 		 <% if(r_vo.size()!=0){
   				for(int j=0; j<r_vo.size(); j++){
                star += r_vo.get(j).getREVIEW_RATINGS();
               } 
             
                
                t_star = star/r_vo.size();
          	 	t_star2= (double)star/r_vo.size();
            	t_star3 = Math.round(t_star2 * 100) / 100.0;
              %>
                 
               <% for(int j=0; j<t_star; j++){%>
                <img src="./img/icon/KakaoTalk_20230105_164642873.png" alt="">
                <%} %>   
                <p>
                <%=t_star3%>
                </p>
                <% star = 0;
    			   t_star=0;
    			   t_star2 = 0;
    			   t_star3=0;
                
                 }%>
                 </div>
             

        </div>

   		

      <%}%>
   		</div>
   
    


    <div class="footer">
    </div>
</body>
</html>