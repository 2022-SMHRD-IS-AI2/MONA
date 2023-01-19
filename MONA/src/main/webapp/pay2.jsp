<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.OrderVO"%>
<%@page import="com.smhrd.model.OrderDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<body>

  <%
  String loginUser = (String) session.getAttribute("loginUser_id");
	
  // 바로 구매시 상품이름 가격정보 받아오기 
  request.setCharacterEncoding("UTF-8");
  int price = Integer.parseInt(request.getParameter("price"));
  int cnt = Integer.parseInt(request.getParameter("cnt"));
  String prod_name = request.getParameter("prod_name");
  
  %>

	<!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <script>
        var IMP = window.IMP; 
        IMP.init("imp57011454"); 
      
        var today = new Date();   
        var hours = today.getHours(); // 시
        var minutes = today.getMinutes();  // 분
        var seconds = today.getSeconds();  // 초
        var milliseconds = today.getMilliseconds();
        var makeMerchantUid = hours +  minutes + seconds + milliseconds;
        

        function requestPay() {
            IMP.request_pay({
                pg : 'html5_inicis.INIpayTest',
                pay_method : 'card',
                merchant_uid: "IMP"+makeMerchantUid, 
                name : '<%=prod_name%>',
                amount : '<%=price%>',
                buyer_email : 'Iamport@chai.finance',
                buyer_name : '아임포트 기술지원팀',
                buyer_tel : '010-1234-5678',
                buyer_addr : '서울특별시 강남구 삼성동',
                buyer_postcode : '123-456'
            }, function (rsp) { // callback
                if (rsp.success) {
                  location.href = 'orderSuccessCon';
                } else {
                   location.href = 'pay.jsp';
                }
            });
        }
        
        requestPay();
        </script>
        
        
</head>
</body>
</html>