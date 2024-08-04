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
public class Port {
    private int idx;
    @NonNull private String mb_Email;
    @NonNull private String pf_Path;
    @NonNull private String pf_Name;
    private java.sql.Timestamp created_at; // 추가: created_at 필드

    public Port(@NonNull String mb_Email) {
        this.mb_Email = mb_Email;
    }

    // MyBatis가 사용할 생성자 추가
    public Port(java.math.BigDecimal idx, String mb_Email, String pf_Path, String pf_Name, java.sql.Timestamp created_at) {
        this.idx = idx.intValue();
        this.mb_Email = mb_Email;
        this.pf_Path = pf_Path;
        this.pf_Name = pf_Name;
        this.created_at = created_at;
    }

	public int getIdx() {
		return idx;
	}

	public String getMb_Email() {
		return mb_Email;
	}

	public String getPf_Path() {
		return pf_Path;
	}

	public String getPf_Name() {
		return pf_Name;
	}

	public java.sql.Timestamp getCreated_at() {
		return created_at;
	}

	public Port(@NonNull String mb_Email, @NonNull String pf_Path, @NonNull String pf_Name) {
		super();
		this.mb_Email = mb_Email;
		this.pf_Path = pf_Path;
		this.pf_Name = pf_Name;
	}
	
	
    
}
