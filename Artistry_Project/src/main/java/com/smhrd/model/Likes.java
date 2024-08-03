package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
@NoArgsConstructor
@AllArgsConstructor
@RequiredArgsConstructor
@Getter
@Setter
public class Likes {
	@NonNull
    private Double like_Idx;
	@NonNull
    private String mb_Email;
	@NonNull
    private String artist_Email;

    private String created_At;

	public Likes(@NonNull String mb_Email) {
		super();
		this.mb_Email = mb_Email;
	}

	public Likes(@NonNull String mb_Email, @NonNull String artist_Email) {// 좋아요 기능 용
		super();
		this.mb_Email = mb_Email;
		this.artist_Email = artist_Email;
	}

	public Double getLike_Idx() {
		return like_Idx;
	}

	public String getMb_Email() {
		return mb_Email;
	}

	public String getArtist_Email() {
		return artist_Email;
	}

	public String getCreated_At() {
		return created_At;
	}
	
	
}
