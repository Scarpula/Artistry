package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class NaverUser {
    private Long id;
    private String name;
    private String email;
    private String nickname;
    private String profileImg;
    private String gender;
    private String birthday;
    private String age;
    private String birthyear;
    private String mobile;
	public Long getId() {
		return id;
	}
	public String getName() {
		return name;
	}
	public String getEmail() {
		return email;
	}
	public String getNickname() {
		return nickname;
	}
	public String getProfileImg() {
		return profileImg;
	}
	public String getGender() {
		return gender;
	}
	public String getBirthday() {
		return birthday;
	}
	public String getAge() {
		return age;
	}
	public String getBirthyear() {
		return birthyear;
	}
	public String getMobile() {
		return mobile;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public void setBirthyear(String birthyear) {
		this.birthyear = birthyear;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
    
}

