<%@page import="com.smhrd.model.CommentDAO"%>
<%@page import="com.smhrd.model.CommentVO"%>
<%@page import="com.smhrd.model.BoardVO"%>
<%@page import="com.smhrd.model.BoardDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
      <title>Forty by HTML5 UP</title>
      <meta charset="utf-8" />
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
      <link rel="stylesheet" href="assetsBoard/css/main.css" />
      <link rel="stylesheet" href="assetsBoard/css/board.css" />
      <!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
      <!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
      
</head>
<body>      
        <!-- Q19. 게시글 세부내용 조회 기능 
               : select * from web_baord where num= 선택한 게시글의 num -->

	<%
	int b_num = Integer.parseInt(request.getParameter("b_num"));
	BoardVO vo = new BoardDAO().detailBoard(b_num);
	%>
	
	<%
	CommentVO cvo = new CommentVO(b_num);
	List <CommentVO> lvo = new CommentDAO().showCmt(cvo);
	%>
	
	<!-- Q18. 게시글 목록 세부페이지 기능(제목을 클릭하면 세부페이지 BoardDetail.jsp로 이동)-->
	<div id="board">
		<table id="list">
			<tr>
				<td>제목</td>
				<td><%=vo.getTitle()%></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><%=vo.getId()%></td>
			</tr>
			<tr>
				<td>다운로드</td>
				<td><a href="./file2/<%=vo.getFile()%>" download>다운로드</a></td>
			</tr>
			<tr>
				<td colspan="2">내용</td>
			</tr>
			<tr>
				<td colspan="2">
					<h3><%=vo.getContent()%></h3> <img
					src="./file2/<%=vo.getFile()%>">
				</td>
			</tr>
			<tr>
				<td colspan="2"><a href="boardMain.jsp"><button>뒤로가기</button></a></td>
			</tr>
		</table>
	</div>


	<h3>댓글
	<br>
	<%
	
	for(int j=0; j < lvo.size(); j++){%>
		
		<% for(int i=j; i <= j; i++) { %>
	    <td><%=
	    lvo.get(j).getU_Id()
	    %></td>
	    <hr>
	    <%}%>
		
		<% for(int i=j; i <= j; i++) { %>
	    <td><%=
	    lvo.get(j).getCMT_CONTENT()
	    %></td>
	    <%}%>
		
		<% for(int i=j; i <= j; i++) { %>
	    <td><%=
	    lvo.get(j).getCMT_REGDT()
	    %></td>
	    <hr>
	    <%}%>
	    
		</tr>
		<br>
	<% } %>
	
	
	</h3>
	
	<hr>
	
	<div class="container">
		<div class="form-group">
			<form method="post" action="CommentCon">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<tr>
						<td style="border-bottom: none;" valign="middle"><br>
						
						</td>
						<input hidden name="b_num" value="<%=b_num%>">
						<td><input type="text" style="height: 100px;"
							class="form-control" placeholder="상대방을 존중하는 댓글을 남깁시다."
							name="commentText"></td>
						<td><br>
						<br>
						<input type="submit" class="btn-primary pull" value="댓글 작성"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>



	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="assets/js/main.js"></script>
</body>
</html>