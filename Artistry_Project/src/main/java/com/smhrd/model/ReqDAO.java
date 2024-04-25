package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class ReqDAO {

	SqlSessionFactory sf = SqlSessionManager.getSqlSession();
	
	
	public int insertReq(Req ReqInfo) {

		SqlSession session = sf.openSession(true);
		int cnt = session.insert("com.smhrd.db.ReqMapper.insertReq", ReqInfo);
		session.close();
		return cnt;
	}

	
	
	
	
}
