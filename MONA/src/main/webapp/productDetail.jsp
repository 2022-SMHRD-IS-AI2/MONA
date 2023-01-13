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
</head>
<body>
 <%
  	String loginUser = (String) session.getAttribute("loginUser_id");
	
	if(loginUser != null){
		System.out.print(loginUser);
	}
	
	%>
	
	<%
   int prod_num = Integer.parseInt(request.getParameter("prod_num"));
   ProductVO vo = new ProductDAO().showProdDetail(prod_num);
   %>
   
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
            	<%
			if(loginUser == null){%>
					<!--로그인 안했을 경우  -->
				<a href="login.jsp"></a>
			<% }else {%>
				<% // 관리자가 로그인 했을 때 이용자(소비자,판매자)마이페이지가 아닌 관리자 마이페이지로 이동
				if(loginUser.equals("admin")){%>
					  <a href="adminMypage.jsp">마이페이지</a>	
            <%}else {%>
                        <!--관리자가 아닌 유저(소비자,판매자)가 로그인 성공 시 이용자 전용 마이페이지로 이동 -->
				 <a href="Mypage.jsp">마이페이지</a>
            <%}%> 
			<%} %>
            <a href="boardMain.jsp">게시판</a>
            <a href="login.jsp">로그인</a>
            <a href="join.jsp">회원가입</a>            
        </div>
    </div>
    <div class="header2">   
        <a href="food.jsp">식품</a>
        <a href="clothes.jsp">의류</a>
        <a href="toy.jsp">장난감</a>
        <a href="goods.jsp">굿즈</a>
    </div>

    <div class="productdetail">
        <div class="productdetail-content">
            <img src="./prod/<%=vo.getProd_thumb()%>" alt="">
           
            <div class="shipping c">
                <button type="button" class="shipping-a" href="">상품정보</button >
                <button type="button" class="shipping-a" href="">구매후기</button >
                <button type="button" class="shipping-a" href="">댓글</button >
            </div>
            <div><img src="./prod/<%=vo.getProd_img()%>" alt=""></div>
            
            <div class="ProductDetailDescription__textItem1">
                <span>
                <%=vo.getProd_desc()%> 
                </span>
            </div>

            <div class="feedback">
                <h2>구매후기(3)</h2>
                <a href="">구매후기 작성하기</a>
            </div>
            <a href="">
                <div class="reviewer-info-header">
                    <div class="reviewer-info">
                        <span class="reviewer-name">김준연</span>
                        <span class="reviewer-date">2023년 1월 11일</span>
                    </div>
                    <div class="reviewer-grade" >
                        <i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i>
                    </div>
                </div>
                <div class="review-body">
                    <div class="review-thumbnail">
                        <img src="/img/반려동물의류/리뷰/리뷰.jpg" alt="">
                    </div>
                    
      
                    <div class="review-contents">어떡해요... 너무 사이즈도 꼭맞고 이뻐서 심장마비 올거같아요 ㅠㅠㅠㅠㅠㅜㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠ
                        이뿌게 해주셔서 감사합니다</div>

                </div>
            </a>
            
            <div class="comment1">
                <h2>댓글</h2>
            </div>
            
            
            
            <div class="comment2">
                <div class="comment-input">
                    <input type="text" placeholder="댓글을 입력하세요">
                </div>
                <div class="comment-btn">
                    <button type="submit">등록</button>
                </div>
            </div>
            
        </div>
        
        <div class="productdetail-description">
            <h2 class="productdetail-description-title"><%=vo.getProd_name()%> </h2>
        
            <div class ="productdetail-info">
                <div class="productdetail-description-price" >
                    <span class="productdetail-description-price-span">
                        <strong><%=vo.getProd_price()%></strong>원
                    </span>
                    <div class="price_tag-detail ">
                        
                    </div>
                    
                        <div class="data-row">
                        
                        </div>
                        <div class="data-row">
                            <table>
                                <tr>
                                    <td class="data-row__title">
                                        구매후기
                                    </td>
                                    <td>
                                        <i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i>
                                    </td>
                                </tr>
                            </table>
                        </div>
                      
                    
                        <div class="data-row">
                            <table>
                                <tr>
                                    <td class="data-row__title">
                                        수량
                                    </td>
                                    <td>
                                   <input type="number" min="1" max="9999" name="count" >
                                    </td>
                                
                                </tr>
                            </table>
                        </div>

                </div>   
            </div> 
            <div class="productdetailbox">
       
            <div class="productdetail-description-sum" >
                <h2>총금액</h2>
                <h2>0원</h2>
            </div>  
            <div class="productdetail-description-buy" >
                <button type="submit" class="pd-btn cart">장바구니</button>
                
                <button type="submit" class="pd-btn buy">구매하기</button>
            </div> 
            </div>
            
            
         
        </div>
    
      
    </div> 


            
        
    </div>

    <script src="/js/productdetail.js"></script>
            
</body>
</html>