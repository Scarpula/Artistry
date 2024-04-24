package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.Member;
import com.smhrd.model.MemberDAO;

public class MemberDeleteService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String delEmail = request.getParameter("email");
		System.out.println(delEmail);
		Member delMember = new Member(delEmail);
		int cnt = new MemberDAO().deleteMember(delMember);
		
		if(cnt>0) {
			System.out.println("delete success");
		}
		response.sendRedirect("MyPage.jsp");
	}

}
