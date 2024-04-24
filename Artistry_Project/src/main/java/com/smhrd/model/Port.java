package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@RequiredArgsConstructor
@Setter
@Getter
@ToString
public class Port {
	
	private int idx;
	@NonNull private String mb_Email;
	@NonNull private String pf_Path;
	@NonNull private String pf_Name;
	@NonNull private String pf_Cate;
	@NonNull private String pf_Info;
	public Port(@NonNull String mb_Email) {
		super();
		this.mb_Email = mb_Email;
	}
	
	
}
