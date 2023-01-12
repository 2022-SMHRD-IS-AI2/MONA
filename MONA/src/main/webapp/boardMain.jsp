

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
      
</head>
<body>      
       <!-- Q17. 게시글 목록 조회 기능 
         		: web_baord 테이블에 있는 모든 게시글 출력
         		: select * from web_baord-->
         	  <% List<BoardVO> vo = (new BoardDAO()).showBoard(); %>         
         	
         	
         <!-- Q18. 게시글 목록 세부페이지 기능(제목을 클릭하면 세부페이지 BoardDetail.jsp로 이동)-->
         <div id="board">
            <table id = "list">
               <tr> 
                  <td>번호</td>
                  <td>제목</td>
                  <td>작성자</td>
                  <td>시간</td>
                </tr>
            
             	<%for(int i =0; i< vo.size();i++){ %>
            		<tr> 	
                  		<td><%=i+1 %></td>
                  		<td><a href="boardDetail2.jsp?b_num=<%=vo.get(i).getNum() %>"><%=vo.get(i).getTitle() %></a></td>
 		                <td><%=vo.get(i).getId() %></td>
        		        <td><%=vo.get(i).getRegdt().toString() %></td>
               </tr>
            
            
            	<%} %>  
            </table>
            
            <a href="./main.jsp"><button id="writer">홈으로가기</button></a>
            <a href="./boardWrite2.jsp">
            <button id="write">작성하러가기</button>
            </a>
            
         </div>

        
</body>
</html>