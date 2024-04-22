package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@RequiredArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class Portfolio {

	private int like_Idx; //좋아요
	@NonNull private String pf_Path; // 포트폴리오 그림 사진
	@NonNull private String pf_Name; // 포르폴리오 제목
	@NonNull private String pf_Info; // 아티스트 정보 글
	
}
