package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class PortDAO2 {
	
	SqlSessionFactory sf = SqlSessionManager.getSqlSession();

	public int portinfo(Port2 port2) {
		SqlSession session = sf.openSession(true);
		int cnt = session.insert("com.smhrd.db.Port2Mapper.portinfo", port2);
		session.close();
		return cnt;
	}
	
	public Port2 selectinfo(String artistEmail) {
			SqlSession session = sf.openSession(true);
			Port2 portInfo = session.selectOne("com.smhrd.db.Port2Mapper.selectinfo",artistEmail);
			session.close();
			return portInfo;
		}
}
