package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.Member;
import com.smhrd.model.MemberDAO;

public class MyPage_EditInfo extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String email = request.getParameter("email");
		String nick = request.getParameter("nick");
		String phone = request.getParameter("phone");
		String name = request.getParameter("name");
		String addr1 = request.getParameter("mb_Addr");
		String addr2 = request.getParameter("mb_Addr2");
		String pw = request.getParameter("pw");
		String addr = addr1 + ' ' + addr2;
		
		Member member = new Member(email,pw,phone,name,nick,addr);
		int cnt = new MemberDAO().update_info(member);
		
		if(cnt>0) {
			System.out.println("정보 수정 성공");
			
		}else {
			System.out.println("정보 수정 실패");
			
		}
		
		response.sendRedirect("index.jsp");
	}

}
