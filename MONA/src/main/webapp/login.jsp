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
    <link rel="stylesheet" href="./CSS/login.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">

</head>
<body>
<%String loginUser = (String) session.getAttribute("loginUser_id");

int b =0; 


if(loginUser != null){
	   String u_id= (String) session.getAttribute("loginUser_id");
		List<ProductVO> vo2 = new ProductDAO().showBk(u_id);
	   b=vo2.size();
}



%>
  <div class="header">
        <div class="header-logo">
   
            <a href="main.jsp"><h2>MonA</h2></a>
    <div class="header-serch" >
            <input type="text" name="" id="">
            
        </div>
        <a href=""><i class="fa-solid fa-magnifying-glass"></i></a>
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
    
    <main class="loginform">  
        <div class="loginform-con">
            <h2>Login</h2>
            <form class="input" action="LoginCon" method="post">
                <h3>Username</h3>
                <div class="inputlogin" >
                    <input type="text" style="border: none; background-color: transparent;" name="id" >
                </div>
                <h3>Password</h3>
                <div class="inputlogin">
                    <input type="password" style="border: none; background-color: transparent;" maxlength="15" name="pw">
                    <!-- input type="text" style="border: none; background: transparent;" -->
                </div>
                <div class="inputspan">
                    <span>Forgot your login information?</span>
                </div>
                <button class="inputsubmit" type="submit">
                    <span>Login</span>
                </button>
            </form>
            <div class="kana">
                <button>
                    <a href="kakaoLogin.jsp">kakao Login</a>
                </button>
                <button>
                    <a href="#">Naver Login</a>
                </button>
                
                <div class="signUp">
                    <p class="signUp-p">
                        <a href="#">
                            Would you like to join. . .?</a>
                    </p>
                </div>
            </div>
        </div>
    </main>  
     
		 <div class="footer">
    	</div>
</body>
</html>