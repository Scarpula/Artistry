package com.smhrd.model;

import java.util.List;

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

	public List<Member> get_artist_list() {
	// 아티스트 리스트 가져오기
		SqlSession session = sf.openSession(true);
		List<Member> artistList = session.selectList("com.smhrd.db.MemberMapper.artistList");
		session.close();
		return artistList;
	}

	public List<Member> getMemberList() {
		SqlSession session = sf.openSession(true);
		List<Member> memberList = session.selectList("com.smhrd.db.MemberMapper.memberList");
		session.close();
		return memberList;
	}

	public int deleteMember(Member delMember) {
		SqlSession session = sf.openSession(true);
		int cnt = session.update("com.smhrd.db.MemberMapper.delete_member", delMember);
		session.close();
		return cnt;
	}

}
