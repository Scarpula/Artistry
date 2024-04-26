package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class ArtistDAO {
	
	SqlSessionFactory sf = SqlSessionManager.getSqlSession();
	
	public Artists getArtistInfo(String email) {
		SqlSession session = sf.openSession(true);
		Artists artist = session.selectOne("com.smhrd.db.ArtistMapper.getArtistInfo",email);
		session.close();
		return artist;
	}

	public int editArtistInfo(Artists artist) {
		SqlSession session = sf.openSession(true);
		int cnt = session.update("com.smhrd.db.ArtistMapper.editArtistInfo",artist);
		session.close();
		return cnt;
	}

	public int addArtist(String artist_email) {
		SqlSession session = sf.openSession(true);
		int cnt = session.insert("com.smhrd.db.ArtistMapper.insertArtist",artist_email);
		return cnt;
	}
	
	
}
