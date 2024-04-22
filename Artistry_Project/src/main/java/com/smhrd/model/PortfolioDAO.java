package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class PortfolioDAO {

	SqlSessionFactory sf = SqlSessionManager.getSqlSession();
	
	public List<Portfolio> showBoard(){
		SqlSession session = .openSession(true);
		List<Portfolio> boardList = session.selectList("com.smhrd.db.BoardMapper.showPortfolio");
		session.close();
		return boardList;
	}
	
	public int insertBoard(Portfolio portfolio) {
		SqlSession session = sf.openSession(true);
		int cnt = session.insert("com.smhrd.db.BoardMapper.insertBoard", board);
		session.close();
		return cnt;
	}
		
	
}
