package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SignUpClasificationService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		request.setCharacterEncoding("UTF-8");
		
		String checkbox1 = request.getParameter("checkbox1");
		String checkbox2 = request.getParameter("checkbox2");

		
		System.out.println("checkbox1 : " + checkbox1);
		System.out.println("checkbox2 : " + checkbox2);
	

	
		
		System.out.println(checkbox1 + checkbox2);
		
		response.sendRedirect("log-in.html");

	}

}
