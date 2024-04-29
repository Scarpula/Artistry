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
	
	public List<Port2> selectinfo(Port2 port2) {
			SqlSession session = sf.openSession(true);
			List<Port2> infoList = session.selectList("com.smhrd.db.Port2Mapper.selectinfo",port2);
			session.close();
			return infoList;
		}
}
