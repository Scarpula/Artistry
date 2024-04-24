package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.model.GoogleUser;
import com.smhrd.db.SqlSessionManager;

public class GoogleUserDAO {
    private SqlSessionFactory sf = SqlSessionManager.getSqlSession();

    public void insertGoogleUser(GoogleUser googleUser) {
        try (SqlSession session = sf.openSession(true)) {
            session.insert("insertGoogleUser", googleUser);
        }
    }
}
