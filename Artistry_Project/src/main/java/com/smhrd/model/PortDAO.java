package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class PortDAO {

	SqlSessionFactory sf = SqlSessionManager.getSqlSession();
	
	public int insertPort(Port port) {
		SqlSession session = sf.openSession(true);
		int cnt = session.insert("com.smhrd.db.PortMapper.insertPort", port);
		session.close();
		return cnt;
	}
	
	public List<Port> get_port_list(String artistEmail) {
		SqlSession session = sf.openSession(true);
		List<Port> portList = session.selectList("com.smhrd.db.PortMapper.getPortList",artistEmail);
		return portList;
	}

}
	

