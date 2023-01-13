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

<% //로그인 된 상태인지 확인하기 위해 로그인 성공시 세션에 저장한 아이디 값 가져오기
  	String loginUser = (String) session.getAttribute("loginUser_id");
	
	if(loginUser != null){
		System.out.print(loginUser);
	}
	
	List<ProductVO> vo = (new ProductDAO()).showCate();
	%>  
	

<body>
  <div class="header">   
        <div class="header-logo">
            <a href="index.html">MonA</a>
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
    <div class="banner">
    
    
    </div>

   <div class="head-title" >
    <h1>의류</h1>
   </div>
   <%for(int i=0; i<vo.size(); i++){%>
   
   <%if(vo.get(i).getProd_cate().equals("의류")){%>
   
       <div class="contents">
        <div class="contents-child">
            <div class="contents-child-img">
                <a href="#">
                    <img src="./prod/<%=vo.get(i).getProd_thumb()%>" alt="">
                </a>
            </div>
            <div class="contents-child-title" >
                <span><%=vo.get(i).getShop_name()%></span>
                <a href="#"><span><%=vo.get(i).getProd_name()%></span></a>
                  <span>가격    <%=vo.get(i).getProd_price()%>   원</span>
            </div>
            <div class="contents-child-star">
                <img src="./img/icon/KakaoTalk_20230105_164642873.png" alt="">
                <img src="./img/icon/KakaoTalk_20230105_164642873.png" alt="">
                <img src="./img/icon/KakaoTalk_20230105_164642873.png" alt="">
                <img src="./img/icon/KakaoTalk_20230105_164642873.png" alt="">
                <img src="./img/icon/KakaoTalk_20230105_164642873.png" alt="">
            
        </div>
   <%}%>
   
   <%}%>

       
            
        </div>

    </div>

    <div class="footer">
    </div>
</body>
</html>