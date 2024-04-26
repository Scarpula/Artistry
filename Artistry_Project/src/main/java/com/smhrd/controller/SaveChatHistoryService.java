package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.ChatHistory;
import com.smhrd.model.ChatHistoryDAO;

public class SaveChatHistoryService extends HttpServlet {
	
	private ChatHistoryDAO chatHistoryDAO = new ChatHistoryDAO();
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
        String senderId = request.getParameter("senderId");
        String receiverId = request.getParameter("receiverId");
        String chatHistory = request.getParameter("chatHistory");
        
        ChatHistory chatHistoryObj = new ChatHistory();
        chatHistoryObj.setSenderId(senderId);
        chatHistoryObj.setReceiverId(receiverId);
        chatHistoryObj.setChatHistory(chatHistory);

        chatHistoryDAO.saveChatHistory(chatHistoryObj);
        
        response.setContentType("text/plain");
        response.getWriter().write("Chat history saved successfully");
		
	
	}

}
