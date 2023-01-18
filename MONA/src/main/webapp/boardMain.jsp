<%@page import="com.smhrd.model.ProductDAO"%>
<%@page import="com.smhrd.model.ProductVO"%>
<%@page import="com.smhrd.model.BoardVO"%>
<%@page import="com.smhrd.model.BoardDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" href="./CSS/main.css">
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

   <div class="board_wrap">
      <div class="board_title">
         <strong>게시판</strong>
         <p>* 묻고 답하고 소통하는 공간 *</p>
      </div>
      <div class="board_list_wrap">
         <div class="board_list">
            <div class="top">
               <div class="num">번호</div>
               <div class="title">제목</div>
               <div class="writer">작성자</div>
               <div class="date">작성일</div>
               <div class="count">조회</div>
            </div>
            
            <% List<BoardVO> vo = (new BoardDAO()).showBoard(); %>
            
            <%for(int i =0; i< vo.size();i++){ %>
            <div>
               <div class="num"><%=i+1 %></div>
               <div class="title">
                <a href="boardDetail2.jsp?b_num=<%=vo.get(i).getNum() %>"><%=vo.get(i).getTitle() %></a>
               </div>
               <div class="writer"><%=vo.get(i).getId() %></div>
               <div class="date"><%=vo.get(i).getRegdt().toString() %></div>
            </div>
            <%} %>
         
         <div class="bt_wrap">
            <a href="main.jsp" clss="on">홈으로가기</a>
            <a href="boardWrite2.jsp" class="on">등록</a>
            
            <br>
		<br>
		<br>
	
            
            <!--<a href="#">수정</a>-->
         </div>
        </div>
        </div>
        </div>
        	 <div class="footer">
    	</div>
   		
		
</body>
</html>