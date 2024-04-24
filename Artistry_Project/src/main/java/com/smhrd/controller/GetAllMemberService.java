package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.Member;
import com.smhrd.model.MemberDAO;

public class GetAllMemberService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		List<Member> memberList = new MemberDAO().getMemberList();
		HttpSession session = request.getSession();
		session.setAttribute("memberList", memberList);
		response.sendRedirect("MyPage.jsp");
	}

}
