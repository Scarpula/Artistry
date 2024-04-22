package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class ChatRoomDAO {
	
	SqlSessionFactory sf = SqlSessionManager.getSqlSession();

	public List<ChatRoom> chat_room_list(ChatRoom chatRoom) {
		SqlSession session = sf.openSession(true);
		List<ChatRoom> chatRoomList = session.selectList("com.smhrd.db.ChatRoomMapper.chat_room_list",chatRoom);
		session.close();
		return chatRoomList;
	}
	
	
	
}
