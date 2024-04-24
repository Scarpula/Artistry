package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GoggleLoginController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String userId = request.getParameter("userId");
		String fullName = request.getParameter("fullName");
		String givenName = request.getParameter("givenName");
		String familyName = request.getParameter("familyName");
		String imageUrl = request.getParameter("imageUrl");
		String email = request.getParameter("email");
		
		
		
	
	}

}
