package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyPage_EditInfo extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String nick = request.getParameter("nick");
		String phone = request.getParameter("phone");
		String name = request.getParameter("name");
		String addr1 = request.getParameter("mb_Addr");
		String addr2 = request.getParameter("mb_Addr2");
		String pw = request.getParameter("pw");
		String addr = addr1 + ' ' + addr2;
		System.out.println(nick);
		System.out.println(phone);
		System.out.println(name);
		System.out.println(addr);
		System.out.println(pw);
		
		
	}

}
