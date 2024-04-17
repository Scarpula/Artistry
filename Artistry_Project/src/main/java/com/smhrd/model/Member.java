package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

// @Data: 만능 - 기본 생성자, getter, setter, toString...
@AllArgsConstructor // 모든 파라미터를 받는 생성자
@NoArgsConstructor // 기본 생성자
@RequiredArgsConstructor // 필요한 파라미터를 받는 생성자
@Getter
@Setter
public class Member {
	@NonNull
	private String mbEmail;
	@NonNull
	private String mbPw;
	@NonNull
	private String mbPhone;
	@NonNull
	private String mbBirthdate;
	@NonNull
	private String mbName;
	@NonNull
	private String mbNick;

	private String mbProfileImg;
	@NonNull
	private String mbAddr;
	@NonNull
	private String joinedAt;
	@NonNull
	private String mbType;
	public Member(@NonNull String mbEmail, @NonNull String mbPw) {
		super();
		this.mbEmail = mbEmail;
		this.mbPw = mbPw;
	}

}

