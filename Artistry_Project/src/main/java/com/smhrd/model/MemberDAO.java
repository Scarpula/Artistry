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

	public Member emailCheck(String inputE) {
		SqlSession session = sf.openSession(true);
		Member member = (Member)session.selectOne("com.smhrd.db.MemberMapper.EmailCheck", inputE);
		session.close();
		// System.out.println(member.toString());
		return member;
	}
	
	public int update_info(Member member) {
		// 내 정보 수정 메소드
		SqlSession session = sf.openSession(true);
		int cnt = session.update("com.smhrd.db.MemberMapper.update_my_info", member);
		session.close();
		return cnt;
	}

}
