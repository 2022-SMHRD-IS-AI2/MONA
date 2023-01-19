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
   <title>게시판</title>
    <link rel="stylesheet" href="./CSS/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
</head>

<%String loginUser = (String) session.getAttribute("loginUser_id");

int b =0; 


if(loginUser != null){
	   String u_id= (String) session.getAttribute("loginUser_id");
		List<ProductVO> vo2 = new ProductDAO().showBk(u_id);
	   b=vo2.size();
}

%>
<body>
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
    
    <div class="boad-title">
        <h1 >상품 등록</h1>
    </div>
    
    
    <div class="boad">
        
        <form class="boad-content1" action="ProductCon" method="post"  enctype="multipart/form-data" >
            <div class="boad-content1-input1" >
                <span class="boad-content1-span">상호명</span>
                <input type="text" name="shopName">
            </div>
            <div class="boad-content1-input1" >
            <span class="boad-content1-span">상품 카테고리</span>
                <select class="boad-content1-select" name ="prodCate" >
            <option>식품</option>
            <option>의류</option>
            <option>장난감</option>
            <option>굿즈</option>
            </select>

            </div>         
            <div class="boad-content1-input1">
                <span class="boad-content1-span">상품명</span>
                <input type="text" name="prodName">
            </div>
            <div class="boad-content1-input1"> 
                <span class="boad-content1-span">상품 가격</span>
                <input type="text" name="prodPrice">
            </div>
            <div class="boad-content1-input1"> 
                <span class="boad-content1-span">상품 대표 사진</span>
                 <input type="file" name="prodThumb">
                </div>
            <div class="boad-content1-input1"> 
                <span class="boad-content1-span">상품 이미지</span>
                <input type="file" name="prodImg">
            </div>
            <div class="boad-content1-input2"> 
                <span class="boad-content1-span">상품 설명</span>
                <textarea cols="30" rows="20" style="resize: none;" name="prodDesc"></textarea>
            </div>
            <div class="boad-content1-submit">
                <input type="submit" value="상품등록">
            </div>
            

        </form>
    </div>
    
     <footer id = "footer" class="footer">
            <div class = "full-w">
                <nav class="nav-links">
                    <a class = "m-show" href="#">이용약관</a>
                    <span class = "m-show">|</span>
                    <a class = "m-show" href="#">
                        <strong>개인정보 처리방침</strong>
                    </a>
                    <span class = "m-show">|</span>
                    <a class="m-show" href="#">공지사항</a>
                    <span class = "m-show">|</span>
                    <a class="m-show" href="#">자주 묻는 질문</a>
                    <span class = "m-show">|</span>
                    <a class="m-show" href="#">이벤트</a>
                    <span class = "m-show">|</span>
                    <a class="m-show" href="#">입점문의</a>
                    <span class = "m-show">|</span>
                    <a class="m-show" href="#">About Mona</a>
                    <span class = "m-show">|</span>
                </nav>
            </div> <br>
            <div class="inner-w clf" data-has-inquire-btn="false">
                <div class="text-box fl">
                    <strong>(주) MonA</strong>
                    <ul>
                        <li>대표이사 : 모나랑</li>
                        <li>서울특별시 마포구 동교로 19길 12</li>
                        <li>"사업자 등록번호 : 107-98-83249 "</li>
                        <li>통신판매업신고 : 2022-서울마포-0770</li>
                        <li>호스팅서비스 제공자 : AWS WEB Service, Inc</li>
                    </ul>
                    <span class="mt-fix1">
                        "MonA는 통신판매중개자이며 통신판매의 당사자가 아닙니다."  
                    </span>
                    <span class="copyright">Copyright © 2023 MonA All right reserved.</span>
                </div>
                <div class="text-box f1">
                    <strong>고객센터</strong>
                    <span style="display: inline-block; margin-top: 2px;">(평일 오전 10시 ~ 오후 6시)</span>
                    <ul>
                        <li>
                            <span class="fix-w">대표번호</span>
                            "1688-0821"
                        </li>
                        <li>
                            <span class="fix-w">메일</span>
                            "support@MonA.com"
                        </li>
                        <br>
                  </div>
                <div class="text-box f2">
                        <li>아이디어스 이용 중 궁금하신 점이 있으신가요?</li>
                        <li>메일 또는 플러스친구 `아이디어스`로 연락해주세요.</li>
                        <li>최선을 다해 도와드리겠습니다.</li>
                </div>
                    </ul>
                </div>
            </div>
        </footer>    
    <script ></script>
</body>
</html>