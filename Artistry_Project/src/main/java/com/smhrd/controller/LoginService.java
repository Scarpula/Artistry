package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.Member;
import com.smhrd.model.MemberDAO;

public class LoginService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String email = (String)request.getParameter("email");
		String pw = (String)request.getParameter("pw");
		
		System.out.println(email+pw);
		
		Member member = new Member(email,pw);
		Member loginMember = new MemberDAO().login(member);
		
//		if(loginMember != null) {
//			System.out.println("로그인 성공");
//			
//		}else {
//			System.out.println("로그인 실패");
//			
//		}
	}

}
