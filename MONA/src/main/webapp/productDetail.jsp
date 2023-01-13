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
            <img src="./img/반려동물의류/강아지 고양이 방울 케이프.jpg" alt="">
           
            <div class="shipping c">
                <button type="button" class="shipping-a" href="">상품정보</button >
                <button type="button" class="shipping-a" href="">구매후기</button >
                <button type="button" class="shipping-a" href="">댓글</button >
            </div>
            <div><img src="./img/반려동물의류/강아지 고양이 방울 케이프.jpg" alt=""></div>
            
            <div class="ProductDetailDescription__textItem1">
                <span>
                    <br>
                    릿찌Rritzy를 좋아하는 작가[♥️]로 추가하시고
                    <br>
                    이벤트와 신상업데이트를 실시간으로 받아보세요!<br><br><br><br><br>
                    💗베어폼폼 패딩💗<br><br><br>목까지 올라오는 누빔패딩입니다.<br><br><br>
                    안감으로는 요즘 대세인<br>
                    곰돌이 패턴의 뽀글이 원단을 사용했어요.<br><br>
                    잘 뭉치지 않는 원단으로, 뒤집어서 입히실 수도 있어요🤍<br><br>
                    크게 유행하지 않는 디자인이라<br>
                    매년 겨울 꺼내서 입히실 수 있을거에요 :)<br><br>

                    소형견, 중형견, 대형견까지 사이즈 모두 있어<br>
                    모든 크기의 댕댕이들 개플룩 가능해요!💖       
                </span>
            </div>
            <div class="ProductDetailDescription__textItem2">
                <span>
                    🎈컬러🎈<br>
                    -옐로우💛<br>
                    -민트💚<br>
                    -바이올렛💜<br><br><br><br>
                    
                    
                    🎈사이즈🎈<br>
                    XS , S , M , L , XL , 2XL , 3XL , 4XL<br>
                    사이즈표 참고하여 선택해주세요.<br>
                    (핸드메이드 제품으로 약간의 오차가 있을 수 있습니다.)<br><br><br><br>
                    
                    
                    🎈원단🎈<br>
                    -겉감 : 면 100% + 4온스 솜<br>
                    -안감 : 폴리에스터<br><br><br><br>
                    
                    
                    🎈세탁방법🎈<br>
                    -빨래망에 넣어 물세탁해주세요.<br>
                    (건조기 사용시 줄어들 수 있으므로<br>
                    건조기는 사용하지 말아주세요)<br><br><br>
                    
                    
                    📦A/S 및 교환 안내📦<br>
                    -발송되는 모든 상품 검수 후 발송됩니다.<br>
                    -교환 반품 전에는 반드시 먼저 연락 주시기 바랍니다.<br>
                    -수령 후 7일 이내에 제품 결함 발생은 메시지로<br>
                    문의 부탁드립니다.<br>
                    무상으로 A/S 진행해 드립니다.<br>
                    (택배비 본인부담) 
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
            <h2 class="productdetail-description-title">[맞춤가능] 베어폼폼 패딩 | 소형견부터 대형견까지</h2>
        
            <div class ="productdetail-info">
                <div class="productdetail-description-price" >
                    <span class="productdetail-description-price-span">
                        <strong>50000</strong>원
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