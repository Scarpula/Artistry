package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

import java.sql.Timestamp;

@AllArgsConstructor
@NoArgsConstructor
@RequiredArgsConstructor
@Getter
@Setter
public class Member {
    @NonNull
    private String mb_Email;
    @NonNull
    private String mb_Pw;
    @NonNull
    private String mb_Phone;
    @NonNull
    private String mb_Birthdate;
    @NonNull
    private String mb_Name;
    @NonNull
    private String mb_Nick;

    private String mb_Profile_Img;
    @NonNull
    private String mb_Addr;

    private Timestamp joined_At; // 수정된 타입
    @NonNull
    private Boolean mb_Type;

    // 다양한 생성자들
    public Member(@NonNull String mb_Email, @NonNull String mb_Pw) {
        this.mb_Email = mb_Email;
        this.mb_Pw = mb_Pw;
    }

    public Member(String mb_Email, @NonNull String mb_Pw, @NonNull String mb_Phone, @NonNull String mb_Birthdate,
                  @NonNull String mb_Name, @NonNull String mb_Nick, @NonNull String mb_Addr, @NonNull Boolean mb_Type) {
        this.mb_Email = mb_Email;
        this.mb_Pw = mb_Pw;
        this.mb_Phone = mb_Phone;
        this.mb_Birthdate = mb_Birthdate;
        this.mb_Name = mb_Name;
        this.mb_Nick = mb_Nick;
        this.mb_Addr = mb_Addr;
        this.mb_Type = mb_Type;
    }

    public Member(String mb_Email, @NonNull String mb_Pw, @NonNull String mb_Phone, @NonNull String mb_Name, @NonNull String mb_Nick,
                  @NonNull String mb_Addr) {
        this.mb_Email = mb_Email;
        this.mb_Pw = mb_Pw;
        this.mb_Phone = mb_Phone;
        this.mb_Name = mb_Name;
        this.mb_Nick = mb_Nick;
        this.mb_Addr = mb_Addr;
    }

    public Member(@NonNull String mb_Email) {
        this.mb_Email = mb_Email;
    }

    public Member(@NonNull String mb_Email, @NonNull String mb_Pw, String mb_Profile_Img) {
        this.mb_Email = mb_Email;
        this.mb_Pw = mb_Pw;
        this.mb_Profile_Img = mb_Profile_Img;
    }

    // 모든 필드를 포함하는 생성자
    public Member(String mb_Email, String mb_Pw, String mb_Phone, String mb_Birthdate, String mb_Name, String mb_Nick, 
                  String mb_Profile_Img, String mb_Addr, Timestamp joined_At, Boolean mb_Type) {
        this.mb_Email = mb_Email;
        this.mb_Pw = mb_Pw;
        this.mb_Phone = mb_Phone;
        this.mb_Birthdate = mb_Birthdate;
        this.mb_Name = mb_Name;
        this.mb_Nick = mb_Nick;
        this.mb_Profile_Img = mb_Profile_Img;
        this.mb_Addr = mb_Addr;
        this.joined_At = joined_At;
        this.mb_Type = mb_Type;
    }

    // Getter and Setter for mb_Profile_Img
    public String getMb_Profile_Img() {
        return mb_Profile_Img;
    }

    public void setMb_Profile_Img(String mb_Profile_Img) {
        this.mb_Profile_Img = mb_Profile_Img;
    }

    // 명시적으로 추가된 getter 메서드
    public String getMb_Email() {
        return mb_Email;
    }

    public void setMb_Email(String mb_Email) {
        this.mb_Email = mb_Email;
    }

    public Boolean getMb_Type() {
        return mb_Type;
    }

    public void setMb_Type(Boolean mb_Type) {
        this.mb_Type = mb_Type;
    }

    public String getMb_Nick() {
        return mb_Nick;
    }

    public void setMb_Nick(String mb_Nick) {
        this.mb_Nick = mb_Nick;
    }

	public String getMb_Pw() {
		return mb_Pw;
	}

	public String getMb_Phone() {
		return mb_Phone;
	}

	public String getMb_Birthdate() {
		return mb_Birthdate;
	}

	public String getMb_Name() {
		return mb_Name;
	}

	public String getMb_Addr() {
		return mb_Addr;
	}

	public Timestamp getJoined_At() {
		return joined_At;
	}
    
}
