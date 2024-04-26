package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.ChatMessage;
import com.smhrd.model.ChatMessageDAO;

public class ChatService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		String senderId = request.getParameter("senderId");
		String receiverId = request.getParameter("receiverId");
		String messageContent = request.getParameter("message");
		
		// 채팅 메세지 객체 생성
		ChatMessage message = new ChatMessage();
		message.setSenderId(senderId);
		message.setReceiverId(receiverId);
		message.setMessage(messageContent);
		
		// 메세지 데이터베이스에 저장
		ChatMessageDAO messageDAO = new ChatMessageDAO();
		messageDAO.insertMessage(message);
		
		// 응답 설정
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().print("Message sent successfully");
	
	}

}
