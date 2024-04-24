package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class KakaoUserDAO {

	SqlSessionFactory sf = SqlSessionManager.getSqlSession();

	public void insertKakaoUser(KakaoUser kakaoUser) {
		SqlSession session = sf.openSession(true);
		session.insert("insertKakaoUser", kakaoUser);

	}
}