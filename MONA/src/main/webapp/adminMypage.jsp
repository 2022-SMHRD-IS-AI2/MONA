
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
        <a href="food.jsp"><h3>Food</h3></a>
        <a href="clothes.jsp"><h3>Clothes</h3></a>
        <a href="toy.jsp"><h3>Toy</h3></a>
        <a href="goods.jsp"><h3>Goods</h3></a>
    </div>
    
    <div class="mypage-container">
        <div class="logininfo">
            <div class="logininfo-order">
                <div class="logininfo-order-h2">
                      <h3><span>관리자</span></h3>
                    <h3><span>admin</span></h3>
                </div>
                
                <div class="logininfo-order-product" >
                    <span>상품등록 요청은 총 </span>
                    <span><%=vo.size()+vo1.size()%>건</span>
                    <span>입니다</span>
                </div>
                <div class="logininfo-order-written">
                    <span>승인된 요청은 총 </span>
                    <span><%=vo1.size()%>건</span> 
                    <span>입니다</span>
                </div>
                
            </div>
            <div class="logininfo-order">
                <div class="logininfo-order-number">
                    <span>상품등록 요청 건</span>
                    <i class="fa-solid fa-chevron-right fa-xs"></i>
                </div>
                <div class="logininfo-order-number">
                    <span><%=vo.size()+vo1.size()%>건</span>
                  
                </div>
            </div>
            <div class="logininfo-order">
               <div class="logininfo-order-review">
                  <a href="succesProduct.jsp"><span>승인된 요청 건</span></a>
                    <i class="fa-solid fa-chevron-right fa-xs"></i>
                </div>
                <div class="logininfo-order-review">
                   <span><%=vo1.size()%>건</span> 
                   
                </div>
            </div>

        </div>
     
        <%for(int i =0; i<vo.size(); i++){ %>
        <div class="ordercontents-date">
            <span><h4><%=vo.get(i).getProd_regdt()%></h4> </span>
        </div>
        
        <div class="ordercontents-list">
            <div class="ordercontents-list-img">
            <img  width="350px" height="200px" src="./prod/<%=vo.get(i).getProd_thumb()%>">
            </div>    
            
            <div class="managercontents-list-title">
            	
                <span><%=vo.get(i).getShop_name()%></span>
                <span><%=vo.get(i).getProd_name()%></span>
                <span>가격<%=vo.get(i).getProd_price()%></span>
              </div> 
        
                  <div class="managercontents-list-reveiw">
                 <form action="adminCheckCon" method="post">
                  <input hidden name="adminCheck" value="<%=vo.get(i).getProd_num()%>">
                  <input type="submit" value="승인">
                  </form>     
   
                  <form action="admincheckConX">
                   <input hidden name="adminCheck2" value="<%=vo.get(i).getProd_num()%>">
                  <input type="submit" value="거부">
                  </form> 
                   
            </div>
        </div>
  		<%}%> 
  		
  		    <div class="footer">
    </div>
    
    </div>
        



</body>
</html>