<%@page import="java.util.Map"%>
<%@page import="com.smhrd.model.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
  	String loginUser = (String) session.getAttribute("loginUser_id");
  	String loginUse = (String) session.getAttribute("loginUser_pw");
	
	
	if(loginUser != null){
		out.print(loginUser);
	}
	if(loginUse != null){
		out.print(loginUse);
	}
	
	%>
				<form action="LoginCon" method="post">
				 	<li><input type="text"  placeholder="id 입력하세요" name ="id"></li>
					<li><input type="password"  placeholder="PW를 입력하세요" name = "pw"></li>
					<li><input type="submit" value="LogIn"></li>
				</form>
				<div class="content">
					<p>게시판으로 이동<br></p>
					<ul class="actions">
						<li><a href="boardMain.jsp" class="button next scrolly">게시판</a></li>
					</ul>
				</div>
				
				        <!-- Q16. 게시글 작성 기능(작성된 게시글은 DB에 저장) - 파일업로드 cos.jar 사용 -->
         <div id = "board">
            <form action ="WriterBoardCon" method="post" enctype="multipart/form-data">
            <table id="list">
               <tr>
                  <td>제목</td>
                  <td><input type="text" name="title"> </td>
               </tr>
                  <td colspan="2">내용</td>
               </tr>
               <tr>
                  <td colspan="2">
                     <input  type="file" style="float: right;" name="filename">
                     <textarea name ="content"  rows="10" style="resize: none;"></textarea>         
                  </td>
               </tr>
               <tr>
                  <td colspan="2">
                     <input type="reset" value="초기화">
                     <input type="submit" value="작성하기">
                  </td>
               </tr>
            </table>
            </form>
				
		
</body>
</html>