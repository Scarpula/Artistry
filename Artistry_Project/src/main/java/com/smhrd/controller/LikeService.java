package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.Likes;


public class LikeService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String mb_Email = request.getParameter("mb_email");
		String artist_email = request.getParameter("artist_email");
		System.out.println(mb_Email + artist_email);
		
		Likes like = new Likes(mb_Email,artist_email);
		
		
	}

}
