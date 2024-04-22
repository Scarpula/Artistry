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
	
}
