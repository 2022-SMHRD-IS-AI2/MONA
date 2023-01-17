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
<link rel="stylesheet" href="./CSS/mypage.css">
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
    List<ProductVO> vo2 = (new ProductDAO()).showProdRequest();
    %>
    
    <%
    int allcnt = 0;
    for(int i =0; i<vo2.size(); i++){
    		if(loginUser.equals(vo2.get(i).getSeller_id())){
    			allcnt = allcnt+1;
    		}
    	}
    %>
    
    <%
    int ycnt = 0;
    for(int i =0; i<vo2.size(); i++){
    		if(loginUser.equals(vo2.get(i).getSeller_id())&&vo2.get(i).getShop_check().equals("Y")){
    			ycnt = ycnt+1;
    		}
    	}
    %>
    
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
                    <span><%= loginUser%>님 환영합니다</span>
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
        
        <%for(int i =0; i<vo2.size(); i++){
            
        	if(loginUser.equals(vo2.get(i).getSeller_id())){
        	%>
            
        <div class="ordercontents-date">
            <span><%=vo2.get(i).getProd_regdt()%></span>
        </div>
        <div class="ordercontents-list">
            <div class="ordercontents-list-img">
                <img width="200px" height="150px" src="./prod/<%=vo2.get(i).getProd_thumb()%>">
            </div>    
            <div class="ordercontents-list-title">
                <span><%=vo2.get(i).getShop_name()%></span>
                <span><%=vo2.get(i).getProd_name()%></span>
            </div>       
            <div class="requestcontents-list-state">
                <%if(vo2.get(i).getShop_check().equals("Y")){
                %>
                <span>승인</span>
                
                <%}else if(vo2.get(i).getShop_check().equals("N")){%>
                <span>심사중</span>
                
                <%} %> 
            </div>
        </div>
       <%}%>
       <%}%>
    </div>        
  
</div>

</body>


</html>