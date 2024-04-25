package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.Likes;
import com.smhrd.model.LikesDAO;
import com.smhrd.model.MemberDAO;


public class LikeService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String mb_Email = request.getParameter("mb_Email");
		String artist_Email = request.getParameter("artist_Email");
		System.out.println(mb_Email + artist_Email);
		
		Likes like = new Likes(mb_Email,artist_Email);
		
		int cnt = new LikesDAO().toggleLike(like);
		
		if(cnt < 1) {
			System.out.println("병신");
		}
		else {
			System.out.println("굿");
		}
		
		
		response.sendRedirect("artistry-portfolio-setting-page.jsp");
	}

}
