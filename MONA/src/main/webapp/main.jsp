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
    <div class="banner">
    
    
    </div>

   <div class="head-title" >
    <h1>인기제품</h1>
    <div class="head-title-Enrollment"> 
        <a href="product.jsp">상품등록</a>
    </div>
   </div>

    <div class="contents">
        <div class="contents-child">
            <div class="contents-child-img">
                <a href="#">
                    <img src="./img/반려동물의류/[맞춤가능] 베어폼폼 패딩  소형견부터 대형견까지.jpg" alt="">
                </a>
            </div>
            <div class="contents-child-title" >
                <span>베어폼폼 패딩</span>
                <a href="#"><span>[맞춤가능] 베어폼폼 패딩  소형견부터 대형견까지</span></a>
                <span>기여워용</span>
            </div>
            

            <div class="contents-child-star">
                <img src="./img/icon/KakaoTalk_20230105_164642873.png" alt="">
                <img src="/img/icon/KakaoTalk_20230105_164642873.png" alt="">
                <img src="/img/icon/KakaoTalk_20230105_164642873.png" alt="">
                <img src="/img/icon/KakaoTalk_20230105_164642873.png" alt="">
                <img src="/img/icon/KakaoTalk_20230105_164642873.png" alt="">
                
            </div>
         
            
        </div>
        <div class="contents-child">
            <div class="contents-child-img">
                <img src="/img/반려동물의류/❤5색 왕리본 머리띠 ❤.jpg" alt="">
            </div>
            <div class="contents-child-title" >
                <span>베어폼폼 패딩</span>
                <a href="#"><span>[맞춤가능] 베어폼폼 패딩  소형견부터 대형견까지</span></a>
            </div>
            <div class="contents-child-star">
                <img src="/img/icon/KakaoTalk_20230105_164642873.png" alt="">
                <img src="/img/icon/KakaoTalk_20230105_164642873.png" alt="">
                <img src="/img/icon/KakaoTalk_20230105_164642873.png" alt="">
                <img src="/img/icon/KakaoTalk_20230105_164642873.png" alt="">
                <img src="/img/icon/KakaoTalk_20230105_164642873.png" alt="">
                
            </div>
            <div class="contents-child-comment">
                <span>기여워용</span>
            </div>
            
        </div>
        <div class="contents-child">
            <div class="contents-child-img">
                <img src="/img/반려동물의류/강아지 고양이 방울 케이프.jpg" alt="">
            </div>
            <div class="contents-child-title" >
                <span>베어폼폼 패딩</span>
                <a href="#"><span>[맞춤가능] 베어폼폼 패딩  소형견부터 대형견까지</span></a>
            </div>
            <div class="contents-child-star">
                <img src="/img/icon/KakaoTalk_20230105_164642873.png" alt="">
                <img src="/img/icon/KakaoTalk_20230105_164642873.png" alt="">
                <img src="/img/icon/KakaoTalk_20230105_164642873.png" alt="">
                <img src="/img/icon/KakaoTalk_20230105_164642873.png" alt="">
                <img src="/img/icon/KakaoTalk_20230105_164642873.png" alt="">
                
            </div>
            <div class="contents-child-comment">
                <span>기여워용</span>
            </div>
            
        </div>
        <div class="contents-child">
            <div class="contents-child-img">
                <img src="/img/반려동물의류/반려동물 원목 행거 1단1단XL1단더블형.jpg" alt="">
            </div>
            <div class="contents-child-title" >
                <span>베어폼폼 패딩</span>
                <a href="#"><span>[맞춤가능] 베어폼폼 패딩  소형견부터 대형견까지</span></a>
            </div>
            <div class="contents-child-star">
                <img src="/img/icon/KakaoTalk_20230105_164642873.png" alt="">
                <img src="/img/icon/KakaoTalk_20230105_164642873.png" alt="">
                <img src="/img/icon/KakaoTalk_20230105_164642873.png" alt="">
                <img src="/img/icon/KakaoTalk_20230105_164642873.png" alt="">
                <img src="/img/icon/KakaoTalk_20230105_164642873.png" alt="">
                
            </div>
            <div class="contents-child-comment">
                <span>기여워용</span>
            </div>
            
        </div>
        <div class="contents-child">
            <div class="contents-child-img">
                <img src="/img/반려동물의류/블라썸 보닛스카프 세트.jpg" alt="">
            </div>
            <div class="contents-child-title" >
                <span>베어폼폼 패딩</span>
                <a href="#"><span>[맞춤가능] 베어폼폼 패딩  소형견부터 대형견까지</span></a>
            </div>
            <div class="contents-child-star">
                <img src="/img/icon/KakaoTalk_20230105_164642873.png" alt="">
                <img src="/img/icon/KakaoTalk_20230105_164642873.png" alt="">
                <img src="/img/icon/KakaoTalk_20230105_164642873.png" alt="">
                <img src="/img/icon/KakaoTalk_20230105_164642873.png" alt="">
                <img src="/img/icon/KakaoTalk_20230105_164642873.png" alt="">
                
            </div>
            <div class="contents-child-comment">
                <span>기여워용</span>
            </div>
            
        </div>
        <div class="contents-child">
            <div class="contents-child-img">
                <img src="/img/반려동물의류/우리 강아지 사진으로 만든 커스텀 힙합 티셔츠맨투맨.jpg" alt="">
            </div>
            <div class="contents-child-title" >
                <span>베어폼폼 패딩</span>
                <a href="#"><span>[맞춤가능] 베어폼폼 패딩  소형견부터 대형견까지</span></a>
            </div>
            <div class="contents-child-star">
                <img src="/img/icon/KakaoTalk_20230105_164642873.png" alt="">
                <img src="/img/icon/KakaoTalk_20230105_164642873.png" alt="">
                <img src="/img/icon/KakaoTalk_20230105_164642873.png" alt="">
                <img src="/img/icon/KakaoTalk_20230105_164642873.png" alt="">
                <img src="/img/icon/KakaoTalk_20230105_164642873.png" alt="">
                
            </div>
            <div class="contents-child-comment">
                <span>기여워용</span>
            </div>
            
        </div>
        <div class="contents-child">
            <div class="contents-child-img">
                <img src="/img/반려동물의류/촘촘 솜사탕 도토리 멍도리.jpg" alt="">
            </div>
            <div class="contents-child-title" >
                <span>베어폼폼 패딩</span>
                <a href="#"><span>[맞춤가능] 베어폼폼 패딩  소형견부터 대형견까지</span></a>
            </div>
            <div class="contents-child-star">
                <img src="/img/icon/KakaoTalk_20230105_164642873.png" alt="">
                <img src="/img/icon/KakaoTalk_20230105_164642873.png" alt="">
                <img src="/img/icon/KakaoTalk_20230105_164642873.png" alt="">
                <img src="/img/icon/KakaoTalk_20230105_164642873.png" alt="">
                <img src="/img/icon/KakaoTalk_20230105_164642873.png" alt="">
                
            </div>
            <div class="contents-child-comment">
                <span>기여워용</span>
            </div>
            
        </div>
        <div class="contents-child">
            <div class="contents-child-img">
                <img src="/img/반려동물의류/🍊귤선생님 뀰 귀도리🍊.jpg" alt="">
            </div>
            <div class="contents-child-title" >
                <span>베어폼폼 패딩</span>
                <a href="#"><span>[맞춤가능] 베어폼폼 패딩  소형견부터 대형견까지</span></a>
            </div>
            <div class="contents-child-star">
                <img src="/img/icon/KakaoTalk_20230105_164642873.png" alt="">
                <img src="/img/icon/KakaoTalk_20230105_164642873.png" alt="">
                <img src="/img/icon/KakaoTalk_20230105_164642873.png" alt="">
                <img src="/img/icon/KakaoTalk_20230105_164642873.png" alt="">
                <img src="/img/icon/KakaoTalk_20230105_164642873.png" alt="">
                
            </div>
            <div class="contents-child-comment">
                <span>기여워용</span>
            </div>
            
        </div>

    </div>

    <div class="footer">
    </div>
</body>
</html>