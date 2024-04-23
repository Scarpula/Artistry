package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class ReviewDAO {
	
	SqlSessionFactory sf = SqlSessionManager.getSqlSession();

	public int add_Review(Review reviews) {
		
			SqlSession session = sf.openSession(true); //auto commit
			// 경로, value
			int cnt = session.insert("com.smhrd.db.ReviewMapper.addReview", reviews);
			session.close();
			return cnt;
	}

	public List<Review> showReview(Review mb_Review){
		SqlSession session = sf.openSession(true); //auto commit
		List ReviewList = session.selectList("com.smhrd.db.ReviewMapper.showReview", mb_Review);
		session.close();
		return ReviewList; 
	}
	
	
	
	
	
	
}
