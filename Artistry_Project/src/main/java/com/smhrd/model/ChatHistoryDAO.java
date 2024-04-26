package com.smhrd.model;

import java.io.UnsupportedEncodingException;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class ChatHistoryDAO {

	private SqlSessionFactory sf = SqlSessionManager.getSqlSession();
	
	public void saveChatHistory(ChatHistory chatHistory) {
		SqlSession session = sf.openSession(true);
		try {
			chatHistory.setChatHistory(new String(chatHistory.getChatHistory().getBytes("UTF-8"), "UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		session.insert("saveChatHistory",chatHistory);
	}
	
	public ChatHistory getChatHistory(String senderId, String receiverId) {
		SqlSession session = sf.openSession(true);
		ChatHistory chatHistory = new ChatHistory();
		chatHistory.setSenderId(senderId);
		chatHistory.setReceiverId(receiverId);
		return session.selectOne("getChatHistory",chatHistory);
	}
	
	
}
