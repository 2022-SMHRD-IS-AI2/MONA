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
<link rel="stylesheet" href="./CSS/mypage.css">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">

</head>
<body>
	<!-- 세션에 저장된 로그인된 ID 가져오기 -->
    <%
  	String loginUser = (String) session.getAttribute("loginUser_id");
	
    int b =0; 


    if(loginUser != null){
    	   String u_id= (String) session.getAttribute("loginUser_id");
    		List<ProductVO> vo2 = new ProductDAO().showBk(u_id);
    	   b=vo2.size();
    }	
	%>
	
	<!-- 판매 상품 리스트에 저장하기 -->
	<%
    List<ProductVO> vo = (new ProductDAO()).showProdRequest();
    %>
    
    <!-- 등록상품 수 -->
    <%
    int allcnt = 0;
    for(int i =0; i<vo.size(); i++){
    		if(loginUser.equals(vo.get(i).getSeller_id())){
    			allcnt = allcnt+1;
    		}
    	}
    %>
    
    <!-- 승인된 상품 수 -->
    <%
    int ycnt = 0;
    for(int i =0; i<vo.size(); i++){
    		if(loginUser.equals(vo.get(i).getSeller_id()) && vo.get(i).getShop_check().equals("Y")){
    			ycnt = ycnt+1;
    		}
    	}
    %>
    
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
    
    
    <div class="mypage-container">
        <div class="logininfo">
            <div class="logininfo-order">
                <div class="logininfo-order-h2">
                    <span><%=loginUser%>님 환영합니다</span>
                </div>
                
                <div class="logininfo-order-product" >
                    <span>상품등록 요청은 총 </span>
                    <span><%=allcnt%></span>
                    <span>건입니다</span>
                </div>
                <div class="logininfo-order-written">
                    <span>승인된 상품은 총 </span>
                    <span><%=ycnt%></span> 
                    <span>건입니다</span>
                </div>
                
            </div>
            <div class="logininfo-order">
                <div class="logininfo-order-number">
                    <span>상품등록 요청건수</span>
                    <i class="fa-solid fa-chevron-right fa-xs"></i>
                </div>
                <div class="logininfo-order-number">
                    <span><%=allcnt%></span>
                    <span>건</span>
                </div>
            </div>
            <div class="logininfo-order">
                <div class="logininfo-order-review">
                    <span>승인된 요청건수</span>
                    <i class="fa-solid fa-chevron-right fa-xs"></i>
                </div>
                <div class="logininfo-order-review">
                    <span><%=ycnt%></span>
                    <span>건</span>
                </div>
            </div>

        </div>
        <div class="button">
            <a href="mypage.jsp"><button>주문내역</button></a>
            <a href="requestMypage.jsp"><button>상품등록 요청 내역</button></a>
            <a href="productMypage.jsp"><button>등록한상품내역</button></a> 
        </div>
        
        <%for(int i =0; i<vo.size(); i++){
            
        	if(loginUser.equals(vo.get(i).getSeller_id())){
        	%>
            
        <div class="ordercontents-date">
            <span><%=vo.get(i).getProd_regdt()%></span>
        </div>
        <div class="ordercontents-list">
            <div class="ordercontents-list-img">
                <img width="200px" height="150px" src="./prod/<%=vo.get(i).getProd_thumb()%>">
            </div>    
            <div class="ordercontents-list-title">
                <span><%=vo.get(i).getShop_name()%></span>
                <span><%=vo.get(i).getProd_name()%></span>
                <span><%=vo.get(i).getProd_price()%> 원</span>
            </div>       
            <div class="requestcontents-list-state">
                <%if(vo.get(i).getShop_check().equals("Y")){%>
                <span>승인</span>
                
                <%}else if(vo.get(i).getShop_check().equals("N")){%>
                <span>심사중</span>
                
                <%}else if(vo.get(i).getShop_check().equals("X")){%>
                <span>거부</span>
                
                <%} %> 
            </div>
        </div>
       <%}}%>
    </div>        
  
</div>

</body>


</html>