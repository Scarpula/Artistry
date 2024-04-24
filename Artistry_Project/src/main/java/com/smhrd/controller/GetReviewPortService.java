package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.Port;
import com.smhrd.model.PortDAO;
import com.smhrd.model.Review;
import com.smhrd.model.ReviewDAO;

public class GetReviewPortService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String artistEmail = request.getParameter("artistEmail");
		
		Review review = new Review(artistEmail);
		List<Review> reviewList = new ReviewDAO().showReview(review);
		
		Port port = new Port(artistEmail);
		List<Port> portList = new PortDAO().get_port_list(port);
		
		HttpSession session = request.getSession();
		session.setAttribute("reviewList", reviewList);
		session.setAttribute("portList", portList);
		
		response.sendRedirect("artist-portfolio/artist-portfolio-page.jsp");
	
	}

}
