package com.smhrd.model;

import java.util.List;
import com.smhrd.model.Portfolio1;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class PortfolioDAO {

	SqlSessionFactory sf = SqlSessionManager.getSqlSession();
	
	public List<Portfolio1> showPortfolio(){
		SqlSession session = sf.openSession(true);
		List<Portfolio1> boardList = session.selectList("com.smhrd.db.BoardMapper.showPortfolio");
		session.close();
		return boardList;
	}
	
	public int insertPortfolio(Portfolio1 portfolio) {
		SqlSession session = sf.openSession(true);
		int cnt = session.insert("com.smhrd.db.BoardMapper.insertPortfolio", portfolio);
		session.close();
		return cnt;
	}
		
	
}
