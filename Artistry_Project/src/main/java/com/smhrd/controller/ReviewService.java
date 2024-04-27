package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.Review;
import com.smhrd.model.ReviewDAO;

public class ReviewService extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 
		request.setCharacterEncoding("UTF-8");
		
		String mb_Email = request.getParameter("email");
		String content  = request.getParameter("content");
		String receiver = request.getParameter("receiver");
		int ratings = Integer.parseInt(request.getParameter("ratings"));
		
		
		System.out.print( mb_Email+ content + ratings+receiver);
		
		Review reviews = new Review(mb_Email, content, ratings, receiver);
		
		int cnt = new ReviewDAO().add_Review(reviews);
		if (cnt>0) {
			// 리뷰등록 성공
			System.out.print("등록성공");
		}else {
			//리뷰등록실패
			System.out.print("등록실패 ");
		}
		
		response.sendRedirect("artist-portfolio/artist-portfolio-page.jsp?artistEmail="+receiver);
	
	
	
	
	}

}
