package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.ArtistDAO;
import com.smhrd.model.Artists;

public class MyPage_artistInfo extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String email = request.getParameter("email");
		String cate = request.getParameter("cate");
		int min_price = Integer.parseInt(request.getParameter("min_price"));
		int max_price = Integer.parseInt(request.getParameter("max_price"));
		
		Artists artist = new Artists(email, cate, min_price, max_price);
		int cnt = new ArtistDAO().editArtistInfo(artist);
		
		if(cnt>0) {
			System.out.println("success");
		}
		response.sendRedirect("MyPage.jsp");
	}

}
