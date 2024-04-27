package com.smhrd.model;

import java.util.List;

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

	public List<Req> ReqAll(String mb_Email){
		SqlSession session = sf.openSession(true);
		List<Req> ReqAll = session.selectList("com.smhrd.db.ReqMapper.ReqAll", mb_Email);
		session.close();
		return ReqAll;
	}
	
	
	
}
