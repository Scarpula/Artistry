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

}
