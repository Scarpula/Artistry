package com.smhrd.model;

import java.util.List;

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

	public int addArtist(String artist_email, String artist_nick) {
		SqlSession session = sf.openSession(true);
		int cnt = session.insert("com.smhrd.db.ArtistMapper.insertArtist",artist_email);
		return cnt;
	}
	
	public List<Artists> get_search_list (String keyWord){
		SqlSession session = sf.openSession(true);
		List<Artists> searchList = session.selectList("com.smhrd.db.ArtistMapper.searchArtist",keyWord);
		session.close();
		return null;
	}			
	
	public List<Artists> get_artist_list() {
		// 카테고리 페이지에서 모든 아티스트를 가져오는 메소드
		SqlSession session = sf.openSession(true);
		List<Artists> artistList = session.selectList("com.smhrd.db.ArtistMapper.get_artist_list");
		session.close();
		return artistList;
	}
	
}
