package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class orderCon extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String price=request.getParameter("price");
		String prod_name =request.getParameter("prod_name");
		String b=request.getParameter("b");
		
		int paid_amount=Integer.parseInt(price);
		int prod_cnt=Integer.parseInt(b);
		
		System.out.println("ddddddddddddddddddddddddddddddd"+prod_name);
		System.out.println("ddddddddddddddddddddddddddddddd"+paid_amount);
		System.out.println("ddddddddddddddddddddddddddddddd"+prod_cnt);
		
	}

}
