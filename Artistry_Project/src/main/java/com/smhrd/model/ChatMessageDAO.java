package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class ChatMessageDAO {

	private SqlSessionFactory sf = SqlSessionManager.getSqlSession();
	
	public void insertMessage(ChatMessage message) {
		SqlSession session = sf.openSession(true);
		session.insert("com.smhrd.db.ChatMessageMapper.insertMessage",message);
		session.commit();
	}
	public List<ChatMessage> getChatMessages(String senderId, String receiverId) {
	    SqlSession session = sf.openSession(true);
	    ChatMessage params = new ChatMessage();
	    params.setSenderId(senderId);
	    params.setReceiverId(receiverId);
	    
	    List<ChatMessage> chatMessages = session.selectList("com.smhrd.db.ChatMessageMapper.getChatMessages", params);
	    
	    // receiverId와 senderId를 바꿔서 내가 보낸 메시지도 조회
	    params.setSenderId(receiverId);
	    params.setReceiverId(senderId);
	    
	    List<ChatMessage> sentMessages = session.selectList("com.smhrd.db.ChatMessageMapper.getChatMessages", params);
	    
	    chatMessages.addAll(sentMessages);
	    
	    return chatMessages;
	}
	
}
	


