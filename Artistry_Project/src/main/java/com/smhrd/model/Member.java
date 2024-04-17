package com.smhrd.model;

public class Member {

	// 회원 이메일
	private String mbEmail;
	// 회원 비밀번호
	private String mbPw;
	// 회원 전화번호
	private String mbPhone;
	// 회원 생년월일
	private String mbBirthdate;
	// 회원 이름
	private String mbName;
	// 회원 닉네임
	private String mbNick;
	// 회원 프로필 사진
	private String mbProfileImg;
	// 회원 주소
	private String mbAddr;
	// 회원 가입일자
	private String joinedAt;
	// 회원 구분
	private String mbType;
	
	public Member(String mbEmail, String mbPw, String mbPhone, String mbBirthdate, String mbName, String mbNick,
			String mbProfileImg, String mbAddr, String joinedAt, String mbType) {
		super();
		this.mbEmail = mbEmail;
		this.mbPw = mbPw;
		this.mbPhone = mbPhone;
		this.mbBirthdate = mbBirthdate;
		this.mbName = mbName;
		this.mbNick = mbNick;
		this.mbProfileImg = mbProfileImg;
		this.mbAddr = mbAddr;
		this.joinedAt = joinedAt;
		this.mbType = mbType;
	}
	public Member() {
		super();
	}
	public Member(String mbEmail, String mbPw) {
		super();
		this.mbEmail = mbEmail;
		this.mbPw = mbPw;
	}
	public String getMbEmail() {
		return mbEmail;
	}
	public void setMbEmail(String mbEmail) {
		this.mbEmail = mbEmail;
	}
	public String getMbPw() {
		return mbPw;
	}
	public void setMbPw(String mbPw) {
		this.mbPw = mbPw;
	}
	public String getMbPhone() {
		return mbPhone;
	}
	public void setMbPhone(String mbPhone) {
		this.mbPhone = mbPhone;
	}
	public String getMbBirthdate() {
		return mbBirthdate;
	}
	public void setMbBirthdate(String mbBirthdate) {
		this.mbBirthdate = mbBirthdate;
	}
	public String getMbName() {
		return mbName;
	}
	public void setMbName(String mbName) {
		this.mbName = mbName;
	}
	public String getMbNick() {
		return mbNick;
	}
	public void setMbNick(String mbNick) {
		this.mbNick = mbNick;
	}
	public String getMbProfileImg() {
		return mbProfileImg;
	}
	public void setMbProfileImg(String mbProfileImg) {
		this.mbProfileImg = mbProfileImg;
	}
	public String getMbAddr() {
		return mbAddr;
	}
	public void setMbAddr(String mbAddr) {
		this.mbAddr = mbAddr;
	}
	public String getJoinedAt() {
		return joinedAt;
	}
	public void setJoinedAt(String joinedAt) {
		this.joinedAt = joinedAt;
	}
	public String getMbType() {
		return mbType;
	}
	public void setMbType(String mbType) {
		this.mbType = mbType;
	}
	@Override
	public String toString() {
		return "Member [mbEmail=" + mbEmail + ", mbPw=" + mbPw + ", mbPhone=" + mbPhone + ", mbBirthdate=" + mbBirthdate
				+ ", mbName=" + mbName + ", mbNick=" + mbNick + ", mbProfileImg=" + mbProfileImg + ", mbAddr=" + mbAddr
				+ ", joinedAt=" + joinedAt + ", mbType=" + mbType + "]";
	}
	
	
	
}
