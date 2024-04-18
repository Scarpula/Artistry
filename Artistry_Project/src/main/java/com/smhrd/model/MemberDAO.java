package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class MemberDAO {

	SqlSessionFactory sf = SqlSessionManager.getSqlSession();

	public Member login(Member member) {
		SqlSession session = sf.openSession(true);
		Member loginMember = session.selectOne("com.smhrd.db.MemberMapper.login", member);
		session.close();
		return loginMember;
	}

	public int join(Member member) { // id, pw, name
		SqlSession session = sf.openSession(true); //auto commit
		// 경로, value
		int cnt = session.insert("com.smhrd.db.MemberMapper.join", member);
		session.close();
		return cnt;
	}

}
