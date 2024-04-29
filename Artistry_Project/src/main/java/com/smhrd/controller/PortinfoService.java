package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.Likes;
import com.smhrd.model.LikesDAO;
import com.smhrd.model.MemberDAO;
import com.smhrd.model.Port;
import com.smhrd.model.PortDAO;


public class PortinfoService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String mb_Info = request.getParameter("mb_Info");
		String mb_Title = request.getParameter("mb_Title");
		
		System.out.println(mb_Info + mb_Title); //확인용

		Port port = new Port(mb_Info, mb_Title);
		int cnt = new PortDAO().portinfo(port);
		
		if(cnt > 0) {
			System.out.println("DB 저장 완료");
		}
		else {
			System.out.println("DB 저장 실패");
		}
		response.sendRedirect("artist-portfolio-page.jsp");
}
}
