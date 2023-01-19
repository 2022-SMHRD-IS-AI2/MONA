<%@page import="com.smhrd.model.ReviewDAO"%>
<%@page import="com.smhrd.model.ReviewVO"%>
<%@page import="com.smhrd.model.CommentVO"%>
<%@page import="com.smhrd.model.RequestDAO"%>
<%@page import="com.smhrd.model.RequestVO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.ProductDAO"%>
<%@page import="com.smhrd.model.ProductVO"%>

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
  	String loginUser = (String) session.getAttribute("loginUser_id");
	
 int b =0; 


 if(loginUser != null){
 	   String u_id= (String) session.getAttribute("loginUser_id");
 		List<ProductVO> vo2 = new ProductDAO().showBk(u_id);
 	   b=vo2.size();
 }
	

	%>
	
	<%
   int prod_num = Integer.parseInt(request.getParameter("prod_num"));
   ProductVO vo = new ProductDAO().showProdDetail(prod_num);
   
   RequestVO rvo = new RequestVO(prod_num);
   List<RequestVO> lvo = new RequestDAO().showRequest(rvo);
   %>
   
   
   <%
   ReviewVO vvo = new ReviewVO(prod_num); 
   List<ReviewVO> r_vo = new ReviewDAO().showReview(vvo);

   %>
   
    <script>
      $( document ).ready( function() {     
        $( '#quantity' ).change( function() {
          let a = $( '#quantity' ).val();
          let ab = (a * <%=vo.getProd_price()%>) + " 원";
          $( '#totalPrice' ).text( ab );
        } );
      } );
    </script>
    
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
    
    
    <div class="productdetail">
        <div class="productdetail-content">
            <img src="./prod/<%=vo.getProd_thumb()%>" alt="">
           
            <div class="shipping c">
                <button type="button" class="shipping-a" href="">상품정보</button >
                <button type="button" class="shipping-a" href="">구매후기</button >
                <button type="button" class="shipping-a" href="">댓글</button >
            </div>
            <div><img src="./prod/<%=vo.getProd_img()%>" alt=""></div>
            
            <div class="ProductDetailDescription__textItem1">
                <span>
                <%=vo.getProd_desc()%> 
                </span>
            </div>

            <div class="feedback">
                <h2>구매후기(<%=r_vo.size()%>)</h2>
               
            </div>
            <%

            int star = 0;
            int t_star=0;
            double t_star2 = 0;
            double t_star3=0;
            
            for(int i=0; i<r_vo.size(); i++){ %>
            <a href="">
                <div class="reviewer-info-header">
                    <div class="reviewer-info">
                        <span class="reviewer-name"><%=r_vo.get(i).getU_ID() %></span>
                        <span class="reviewer-date"><%=r_vo.get(i).getREVIEW_DT() %></span>
                    </div>
                    <div class="reviewer-grade" >
                    <%for(int j=0; j<r_vo.get(i).getREVIEW_RATINGS(); j++){ %>
                        <i class="fa-solid fa-star"></i>
                    <%} %>
                    <%=r_vo.get(i).getREVIEW_RATINGS()%>
                    </div>
                </div>
                <div class="review-body">
                    <div class="review-contents">
                    <%=r_vo.get(i).getREVIEW_CONTENT() %>
                    </div>
                </div>
            </a>
            <% 
            star += r_vo.get(i).getREVIEW_RATINGS();
            }
            
            if(r_vo.size()!=0){
           		t_star = star/r_vo.size();
          	 	t_star2= (double)star/r_vo.size();
            	t_star3 = Math.round(t_star2 * 100) / 100.0;
            }
            %>
           
			           
           
            <div class="comment1">
                <h2>댓글(<%=lvo.size()%>)</h2>
            </div>
            
                  <%
         for (int j = 0; j < lvo.size(); j++) {
         %>
      
         <div class="board_view_ripple">
            <%
         for (int i = j; i <= j; i++) {
         %>
            <span><%=lvo.get(j).getU_Id()%>
            </span>
            <%
         }
         %>
         <%
         for (int i = j; i <= j; i++) {
         %>
            <div class="board_view_ripplecoment">
               <p><%=lvo.get(j).getREQ_CONTENT()%></p>
               <p><%=lvo.get(j).getREQ_REGDT()%></p>
            </div>
            
            <%}%>
         </div>

         <%}%>
            
            <div class="comment2">
                <div class="comment-input">
                <form class="board_view_commform" method="post" action="RequestCon">
                <input hidden name="prod_num" value="<%=prod_num%>">
                    <input type="text" placeholder="댓글을 입력하세요" name="commentText">
                </div>
                <div class="comment-btn">
                    <input type="submit" value="등록">
                </div>
            </div>
            </form>
        </div>
        
        <div class="productdetail-description">
            <h2 class="productdetail-description-title"><%=vo.getProd_name()%> </h2>
        
            <div class ="productdetail-info">
                <div class="productdetail-description-price" >
                    <span class="productdetail-description-price-span">
                        <strong><%=vo.getProd_price()%></strong>원
                    </span>
                    <div class="price_tag-detail ">
                        
                    </div>
                    
                        <div class="data-row">
                        
                        </div>
                        <div class="data-row">
                            <table>
                                <tr>
                                    <td class="data-row__title">
                                        구매후기
                                    </td>
                                    <td>
                                    <%for(int i=0; i<t_star; i++){ %>
                                        <i class="fa-solid fa-star"></i>
                                       <%} %>  <%=t_star3%>
                                    </td>
                                  
                                </tr>
                            </table>
                        </div>
                      
                    
                        <div class="data-row">
                            <table>
                                <tr>
                                    <td class="data-row__title">
                                        수량
                                    </td>
                                    <td>
                                    	<form action="bucketCon" method="post">
                                     <input type="number" min="1" max="9999" name="cnt" id="quantity" value="1">
                                    </td>
                                
                                </tr>
                            </table>
                        </div>

                </div>   
            </div> 
            <div class="productdetailbox">
       
            <div class="productdetail-description-sum" >
                <h3>총금액</h3>
                
                <h3><span id="totalPrice"><%=vo.getProd_price()%> 원</span></h3>
            </div>  
            <div class="productdetail-description-buy" >
               
            
            	  <input hidden name="prod_num" value="<%=vo.getProd_num()%>">
            	  <button type="submit" class="pd-btn cart">장바구니</button>
            	</form>
          
                <a href="#"><button class="pd-btn buy">구매하기</button></a>
            </div> 
            </div>
            

        </div>
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
    <script src="./JS/productdetail.js"></script>
            
</body>
</html>