<%@page import="com.smhrd.model.ProductDAO"%>
<%@page import="com.smhrd.model.ProductVO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.BucketDAO"%>
<%@page import="com.smhrd.model.BucketVO"%>
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
  	String loginUser= (String) session.getAttribute("loginUser_id");
	String U_id= (String) session.getAttribute("loginUser_id");
	
	
	List<ProductVO> vo = new ProductDAO().showBk(U_id);
	 
	int b=0;
	
	if(loginUser != null){
		 b = vo.size();
	}
	%>
	
    
   <div class="header">
        <div class="header-logo">
   
            <a href="main.jsp"><h2>MonA</h2></a>
    
        
        </div>
    
        <div class="header-menu" >
        <form class="header-serch" >
            <input type="text" name="" id="">
            <a href=""><i class="fa-solid fa-magnifying-glass"></i></a>	
        </form>
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
   
    <div class="shoppingBag">
        <div class="cartBag">
       
            <div class="cartBag-header">
                <h2>장바구니</h2>
            </div>
        </div>
        
         <% if(vo.size()==0){%>
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
		<%}else {%>
        
        
       <% int sum=0;
        
        for(int i=0; i<vo.size(); i++) {%>
        <div class="cartBag-item">
            <div class="cartBag-item-input">
             <%if(i==0){ %>
                
               <%} %>
            </div>
            <div class="cartBag-itemlist">
                <div class="cartBag-itemlist-productInfo">
                    <div class="cartBag-itemlist-inputcheckbox-grup">
                      
                        <img src="./prod/<%=vo.get(i).getProd_thumb()%>">          
                    </div>
                    <div class="cartBag-itemlist-productInfoTextGroup">
                        <span><%=vo.get(i).getProd_name()%></span>
                        <span>주문시 제작</span>
                    </div>
                </div>
                <div class="cartBag-itemlist-optioninfo">
                    <div class="cartBag-itemlist-optionlist">
                         <div class="cartBag-itemlist-optionlist-price">
                             <%=vo.get(i).getProd_price()%>원
                             수량<%=vo.get(i).getCnt() %>개
                        </div>
                        <div class="cartBag-itemlist-optionlist-btn">
                        <form action="bucketCon" action="post">
                           <input hidden name="loginUser" value="<%=loginUser%>">
                            <button class="cartBag-itemlist-optionlist-btn" type="submit">
                                <i class="fa-solid fa-xmark"></i>
                            </button>
                         </form>
                        </div>
                    </div>
                </div>
             
    
            </div>
            <div class="cartBag-itemlist-section">
                <div class="cartBag-itemlist-sectiondiv">상품가격</div>
                <div class="cartBag-itemlist-section-price">
                 <span>총 <%=vo.get(i).getProd_price()*vo.get(i).getCnt()%> 원</span>
                 <% sum+=vo.get(i).getProd_price()*vo.get(i).getCnt(); %>
                </div>  
            </div>
    </div>
    
 	
      <%} %>
    
  
        <!--주문탭 -->
        <div class="cartList">
        <div class="cartList-content">
            <div class="cartList-content-item">
                <div class="cartList-content-item-label">상품금액</div>
                <div class="cartList-content-item-value">
                    <span><%=sum %></span>
                    <span class="cartList-content-item-price">원</span>
                </div>

			<%
			int a=0;
			
			if(sum>=50000){
				 a = 0;
			} else{
				 a = 3000;			
			}%>
			
            </div>
            <div class="cartList-content-item-fixed">+</div>
            <div class="cartList-content-item">
                <div class="cartList-content-item-label">배송비(5만원이상 무료배송)</div>
                <div class="cartList-content-item-value">
                    <span><%=a%></span>
                    <span class="cartList-content-item-price">원</span>
                </div>
            </div>
            <div class="cartList-content-item-fixed">=</div>
            <div class="cartList-content-item">
                <div class="cartList-content-item-label">결제 예정금액</div>
                <div class="cartList-content-item-value-highlight">
                    <span><%=sum+a%></span>
                    <span>원</span>
                </div>
            </div>
        </div>
  		<div class="shoppingBag-bottom">
    	
    	
        <form action="orderCon" action="post">
         <input hidden name="price" value="<%=sum+a%>">
          <input hidden name="prod_name" value="<%=vo.get(0).getProd_name()%>">
           <input hidden name="b" value="<%=b%>">
            <button class="shoppingBag-bottom-btn" type="submit">결제하기</button>
		</form>
		  </div>
	<% }%>
        </div>
	
    </div>

	 <div class="footer">
    </div>
    

 
</body>


</html>