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

<%
     String loginUser = (String) session.getAttribute("loginUser_id");
   
int b =0; 


if(loginUser != null){
	   String u_id= (String) session.getAttribute("loginUser_id");
		List<ProductVO> vo2 = new ProductDAO().showBk(u_id);
	   b=vo2.size();
}
   
    int prod_num = Integer.parseInt(request.getParameter("prod_num"));
	ProductVO vo = new ProductDAO().showProdDetail(prod_num);	

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
    
    <!--리뷰페이지 시작 -->
    <div class="midpart">
    <div class="midpart_title">
        <strong>리뷰 작성</strong>
        <p>좋은 리뷰써주세요.</p>
    </div>

	
    <div class="midpart_image">
        <a href="#">
        <img src="./prod/<%=vo.getProd_thumb()%>" alt="">
         </a> 
        <div class="product-imfor">
            <div class="product-imfor1">상호 :<%=vo.getShop_name() %> </div>
            <div class="product-imfor1">상품명 : <%=vo.getProd_name()%></div>
             <div class="product-imfor1">가격 :<%=vo.getProd_price()%></div>
             <div class="realstarstar">
                <form name="myform" id="myform" method="post" action="ReviewCon">
                    <fieldset>
                        <legend>별점</legend>
                        <input type="radio" name="rating" value="5" id="rate1"><label for="rate1">⭐</label>
                        <input type="radio" name="rating" value="4" id="rate2"><label for="rate2">⭐</label>
                    <input type="radio" name="rating" value="3" id="rate3"><label for="rate3">⭐</label>
                    <input type="radio" name="rating" value="2" id="rate4"><label for="rate4">⭐</label>
                    <input type="radio" name="rating" value="1" id="rate5"><label for="rate5">⭐</label>
                    </fieldset>
               
            </div>    
        </div>  
    </div>

    <!-- 별점! ! ! -->

    <div class="contrv">
 	<textarea placeholder="리뷰 작성해주세요." name="r_content"></textarea>
    <input hidden name="prod_num" value="<%=prod_num%>">
    </div>
    <div class="bt_wraprv">
     <input type="submit" value="등록">
      </form>
    </div>


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
</body>
</html>