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
	@NonNull private String pf_Title;
	@NonNull private String pf_Info;
	public Port(@NonNull String mb_Email) {
		super();
		this.mb_Email = mb_Email;
	}
	public Port(@NonNull String mb_Email, @NonNull String pf_Path, @NonNull String pf_Name) {
		super();
		this.mb_Email = mb_Email;
		this.pf_Path = pf_Path;
		this.pf_Name = pf_Name;
	}
	public Port(@NonNull String pf_Title, @NonNull String pf_Info) {
		super();
		this.pf_Title = pf_Title;
		this.pf_Info = pf_Info;
	}
	
	
}
