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
	

	
	
	
</body>
</html>