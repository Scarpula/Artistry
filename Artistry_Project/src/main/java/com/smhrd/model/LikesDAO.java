package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class LikesDAO {

	SqlSessionFactory sf = SqlSessionManager.getSqlSession();

	
	public List<Likes> like_list(Likes like) {
		SqlSession session = sf.openSession(true);
		List<Likes> likeList = session.selectList("com.smhrd.db.LikesMapper.like_list", like);
		session.close();
		return likeList;
	}


	public int toggleLike(Likes like) {
		SqlSession session = sf.openSession(true); //auto commit
		// 경로, value
		int cnt = session.insert("com.smhrd.db.LikesMapper.toggleLike", like);
		session.close();
		return cnt;
	}
	
	
	public int removeLike(Likes like) {
	    SqlSession session = sf.openSession(true); 
	        int cnt = session.delete("com.smhrd.db.LikesMapper.deleteLike", like);
	        session.close();  
	        return cnt;  
	    }
	
	
}


