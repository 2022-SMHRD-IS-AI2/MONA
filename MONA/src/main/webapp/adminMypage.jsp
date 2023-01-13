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
   <link rel="stylesheet" href="./CSS/admin.css"> 
   <link rel="stylesheet" href="./CSS/usermypage.css"> 
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
</head>
<style>

</style>
<body>
 <% List<ProductVO> vo = (new ProductDAO()).showProduct(); 
    List<ProductVO> vo1 = (new ProductDAO()).showCate();%>  
       
   <%
  	String loginUser = (String) session.getAttribute("loginUser_id");
	
	if(loginUser != null){
		System.out.print(loginUser);
	}%>
	

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
    
    <div class="mypage-container">
        <div class="logininfo">
            <div class="logininfo-order">
                <div class="logininfo-order-h2">
                    <span>관리자</span>
                    <spacn>admin</span>
                </div>
                
                <div class="logininfo-order-product" >
                    <span>상품등록 요청은 총 </span>
                    <span><%=vo.size()+vo1.size()%></span>
                    <span>건입니다</span>
                </div>
                <div class="logininfo-order-written">
                    <span>승인된 요청은 총 </span>
                    <span><%=vo1.size()%></span> 
                    <span>건입니다</span>
                </div>
                
            </div>
            <div class="logininfo-order">
                <div class="logininfo-order-number">
                    <span>상품등록 요청 건</span>
                    <i class="fa-solid fa-chevron-right fa-xs"></i>
                </div>
                <div class="logininfo-order-number">
                    <span><%=vo.size()+vo1.size()%></span>
                    <span>건</span>
                </div>
            </div>
            <div class="logininfo-order">
                <div class="logininfo-order-review">
                  <a href="succesProduct.jsp"></body> <span>승인된 요청 건</span></a>
                    <i class="fa-solid fa-chevron-right fa-xs"></i>
                </div>
                <div class="logininfo-order-review">
                   <span><%=vo1.size()%></span> 
                    <span>건</span>
                </div>
            </div>

        </div>
       <div>
        <%for(int i =0; i<vo.size(); i++){ %>
        <div class="ordercontents-date">
            <span><%=vo.get(i).getProd_regdt()%> </span>
        </div>
        
        <div class="ordercontents-list">
            <div class="ordercontents-list-img">
            <img  width="250px" height="150px" src="./prod/<%=vo.get(i).getProd_thumb()%>">
            </div>    
            
            <div class="managercontents-list-title">
            	
                <span><%=vo.get(i).getShop_name()%></span>
                
                <span><%=vo.get(i).getProd_name()%></span>
                
                <span>가격    <%=vo.get(i).getProd_price()%></span>
              </div> 
        
                  <div class="managercontents-list-reveiw">
                 <form action="adminCheckCon" method="post">
                  <input hidden name="adminCheck" value="<%=vo.get(i).getProd_num()%>">

                  <input type="submit" value="승인">
                  </form>     
   
                  <form action="#">
                  <input type="submit" value="거부">
                  </form> 
                   
            </div>
        </div>
  		<%}%> 
    
    </div>
        
</div>

</body>
</html>