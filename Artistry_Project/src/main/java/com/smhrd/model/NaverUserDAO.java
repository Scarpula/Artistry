package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class NaverUserDAO {
    SqlSessionFactory sf = SqlSessionManager.getSqlSession();

    public void insertNaverUser(NaverUser user) {
        SqlSession session = sf.openSession(true);
        session.insert("com.smhrd.db.NaverUserMapper.insertNaverUser", user);
        session.close();
    }
}