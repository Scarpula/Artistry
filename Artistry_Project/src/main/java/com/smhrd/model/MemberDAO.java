package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class MemberDAO {
	
	SqlSessionFactory sf = SqlSessionManager.getSqlSession();

	public Member login(Member member) {
		SqlSession session = sf.openSession(true);
		Member loginMember = session.selectOne("com.smhrd.db.MemberMapper.select",member);
		session.close();
		return loginMember;
	}
	
	
}
