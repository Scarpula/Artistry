package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class ChatMessageDAO {

	private SqlSessionFactory sf = SqlSessionManager.getSqlSession();
	
	public void insertMessage(ChatMessage message) {
		SqlSession session = sf.openSession(true);
		session.insert("ChatMessageMapper.insertMessage",message);
		session.commit();
	}
	public List<ChatMessage> getChatMessages(String senderId, String receiverId){
		SqlSession session = sf.openSession(true);
		ChatMessage params = new ChatMessage();
		params.setSenderId(senderId);
		params.setReceiverId(receiverId);
		return session.selectList("ChatMessageMapper.getChatMessage",params);
	}
	
}
	


