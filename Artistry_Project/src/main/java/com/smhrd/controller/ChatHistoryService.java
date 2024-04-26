package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.smhrd.model.ChatHistory;
import com.smhrd.model.ChatHistoryDAO;

public class ChatHistoryService extends HttpServlet {
	private ChatHistoryDAO chatHistoryDAO = new ChatHistoryDAO();
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String senderId = request.getParameter("senderId");
		String receiverId = request.getParameter("receiverId");
		
		ChatHistory chatHistory = chatHistoryDAO.getChatHistory(senderId, receiverId);
	
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(new Gson().toJson(chatHistory));
		
	}

}
