package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.Member;
import com.smhrd.model.Review;
import com.smhrd.model.ReviewDAO;

public class Review_List extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session =  request.getSession();
		Member loginMember = (Member)session.getAttribute("member");
		
		Review mb_Review= new Review(loginMember.getMb_Email());
		List<Review> reviewList = new ReviewDAO().showReview(mb_Review);
		
		session.setAttribute("reviewList", reviewList);
		response.sendRedirect("artist-portfolio/artist-portfolio-page.jsp");
	}

}
