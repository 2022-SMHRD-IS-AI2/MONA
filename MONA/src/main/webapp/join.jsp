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

  <script src = 'https://code.jquery.com/jquery-3.6.1.min.js'></script>
</head>
<body>

<%String loginUser = (String) session.getAttribute("loginUser_id"); 



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

    <main class="signform">  
        <div class="signform-con">
            <h2>
                회원가입
            </h2>
            <form class="input2" action="JoinCon" method="post">
                <span>아이디</span>
                <div class="inputs id">
                <input type="text" placeholder="아이디" id="dcid" name="id">
                <span id="resultCheck"></span>
            <button type="button" id= "inputE" >id체크</button>
            </div>
                <span>비밀번호</span>
                <div class="inputs pw">
                    <input type="password" placeholder="비밀번호" name="pw">
                </div>
                <span>이름</span>
                <div class="inputs name">
                    <input type="text" placeholder="이름" name="name">
                </div>
                <span>닉네임</span>
                <div class="inputs nick">
                    <input type="text" placeholder="닉네임" name="nick">
                </div>
                <span>주소</span>
                <div class="inputs adress">
                    <input type="text" placeholder="주소" name="address">
                </div>
                
                <span>전화번호</span>
                <div class="inputs phone">
                    <input type="text" placeholder="전화번호" name="tel">
                </div>

                <div class="inputs signUp">
                    <input type="submit" value="회원가입">
                </div>

            </form>
        </div>
    </main> 
    
     <div class="footer">
    </div>
       <script>
       let button = document.querySelector("#inputE");
       console.log("버튼제대로눌림")
            function checkE(){
               var inputE = $('#dcid').val()
               console.log(inputE)
               
               $.ajax({
                  // 어디로 요청할 것인지??
                        url : 'idCheckCon',
                        // 요청데이터(jsaon형태, {key, value})
                        data : {'inputE': inputE},
                        // 요청방식
                        type: 'get',
                        // 요청-응답
                        success : function(data){
                           if(data =='true'){
                              $('#resultCheck').text('사용할 수 없는 아이디')
                           }else {
                              $('#resultCheck').text('사용할 수 있는 아이디')
                           }
                        },
                        error : function(){
                           alert("통신실패")
                        }
                        
               })
               
            }
            
            button.addEventListener('click',checkE)
         </script>



</body>
</html>