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
</head>
<body>
   <%
	String prod_cate = request.getParameter("prod_cate");
	ProductVO vo = new ProductDAO().showCate(prod_cate);
	%> 


	
</html>