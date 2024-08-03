package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@RequiredArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Port2 {
    private String pf_Info;
    private String pf_Title;
    private String pf_Sale;
    @NonNull private String mb_Email;

    // 필요에 따른 추가 생성자
    public Port2(@NonNull String mb_Email) {
        this.mb_Email = mb_Email;
    }

	public Port2(String pf_Info, String pf_Title, String pf_Sale, @NonNull String mb_Email) {
		super();
		this.pf_Info = pf_Info;
		this.pf_Title = pf_Title;
		this.pf_Sale = pf_Sale;
		this.mb_Email = mb_Email;
	}

	public String getPf_Info() {
		return pf_Info;
	}

	public String getPf_Title() {
		return pf_Title;
	}

	public String getPf_Sale() {
		return pf_Sale;
	}

	public String getMb_Email() {
		return mb_Email;
	}
	
    
}
