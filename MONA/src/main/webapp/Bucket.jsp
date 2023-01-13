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
    
    <div class="shoppingBag">
        <div class="cartBag">
            <div class="cartBag-header">
                <h2>장바구니</h2>
            </div>
        
        </div>
        <div class="cartBag-item">
            <div class="cartBag-item-input">
                <input class="cartBag-input" type="checkbox">
            </div>
            <div class="cartBag-itemlist">
                <div class="cartBag-itemlist-productInfo">
                    <div class="cartBag-itemlist-inputcheckbox-grup">
                        <div class="cartBag-itemlist-inputcheckbox">
                            <input type="checkbox">
                        </div>
                        <img src="/img/반려동물식품/칼슘듬뿍👍고소한✨아마씨멸치쿠키.jpg">          
                    </div>
                    <div class="cartBag-itemlist-productInfoTextGroup">
                        <span>도톰 바삭한🐔황태치킨말이 수제간식</span>
                        <span>주문시 제작</span>
                    </div>
                </div>
                <div class="cartBag-itemlist-optioninfo">
                    <div class="cartBag-itemlist-optionlist">
                        <div class="cartBag-itemlist-optionlist-cnt">
                            <label class="NumberCounter" for="">
                                <button>-</button>
                                <input type="text">
                                <button>+</button>
                            </label>
                        </div>
                        <div class="cartBag-itemlist-optionlist-price">
                            <p>9000</p>
                            <p>원</p>
                        </div>
                        <div class="cartBag-itemlist-optionlist-btn">
                            <button class="cartBag-itemlist-optionlist-btn">
                                <i class="fa-solid fa-xmark"></i>
                            </button>
                        </div>
                    </div>
               
       
                </div>
             
    
            </div>
            <div class="cartBag-itemlist-section">
                <div class="cartBag-itemlist-sectiondiv">상품가격</div>
                <div class="cartBag-itemlist-section-price">
                    <span>9900</span>
                    <span>원</span>
                </div>  
            </div>
        
 
     
     


    </div>
    <div class="cartList">
   
        
        
        
        
        <div class="cartList-content">
            <div class="cartList-content-item">
                <div class="cartList-content-item-label">상품금액</div>
                <div class="cartList-content-item-value">
                    <span>0</span>
                    <span class="cartList-content-item-price">원</span>
                </div>

            </div>
            <div class="cartList-content-item-fixed">+</div>
            <div class="cartList-content-item">
                <div class="cartList-content-item-label">배송비</div>
                <div class="cartList-content-item-value">
                    <span>3000</span>
                    <span class="cartList-content-item-price">원</span>
                </div>
            </div>
            <div class="cartList-content-item-fixed">=</div>
            <div class="cartList-content-item">
                <div class="cartList-content-item-label">결제 예정금액</div>
                <div class="cartList-content-item-value-highlight">
                    <span>0</span>
                    <span>원</span>
                </div>
            </div>
        </div>
    
    
    
        <div class="shoppingBag-bottom">
            <button class="shoppingBag-bottom-btn">
                    주문하기
                </button>
        </div>

    </div>
	
	
	
</body>
</html>