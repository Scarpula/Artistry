package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.smhrd.model.ChatMessage;
import com.smhrd.model.ChatMessageDAO;
import com.smhrd.model.Member;

public class GetChatMessagesService extends HttpServlet {
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        String loggedInUserEmail = ((Member) request.getSession().getAttribute("member")).getMb_Email();
        String receiverId = request.getParameter("receiverId");
        
        try {
            ChatMessageDAO messageDAO = new ChatMessageDAO();
            List<ChatMessage> chatMessages = messageDAO.getChatMessages(loggedInUserEmail, receiverId);
            
            Gson gson = new Gson();
            String json = gson.toJson(chatMessages);
            
            response.setContentType("application/json; charset=UTF-8");
            response.getWriter().print(json);
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().print("An error occurred on the server.");
        }
    }
}