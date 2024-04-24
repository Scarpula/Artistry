package com.smhrd.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.KakaoUser;
import com.smhrd.model.KakaoUserDAO;

public class KakaoLoginController extends HttpServlet {
	
	private byte[] getImageBytes(String imageUrl) throws IOException {
		URL url = new URL(imageUrl);
		InputStream inputStream = url.openStream();
		ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
		
		byte[] buffer = new byte[4096];
		int bytesRead;
		while ((bytesRead = inputStream.read(buffer)) != -1) {
			outputStream.write(buffer, 0, bytesRead);
		}
		byte[] imageBytes = outputStream.toByteArray();
		inputStream.close();
		outputStream.close();
		
		return imageBytes;
		
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			String email = request.getParameter("email");
			String nickname = request.getParameter("nickname");
			String profileImageUrl = request.getParameter("profileImageUrl");
			
			KakaoUser kakaoUser = new KakaoUser();
			kakaoUser.setEmail(email);
			kakaoUser.setNickname(nickname);
			kakaoUser.setProfileImageUrl(profileImageUrl);
			
			
			KakaoUserDAO kakaoUserDAO = new KakaoUserDAO();
			kakaoUserDAO.insertKakaoUser(kakaoUser);
			
			HttpSession session = request.getSession();
			session.setAttribute("kakaoUser", kakaoUser);
			
			response.sendRedirect("index.jsp");
	
	}


}
