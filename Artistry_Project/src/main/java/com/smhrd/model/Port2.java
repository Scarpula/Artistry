package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Port2 {

	@NonNull private String pf_Info;
	@NonNull private String pf_Title;
	@NonNull private String pf_Sale;
	@NonNull private String mb_Email;
	
	
	public Port2(@NonNull String pf_Info, @NonNull String pf_Title, @NonNull String pf_Sale, @NonNull String mb_Email) {
		super();
		this.pf_Info = pf_Info;
		this.pf_Title = pf_Title;
		this.pf_Sale = pf_Sale;
		this.mb_Email = mb_Email;
	}


	public Port2(@NonNull String pf_Info, @NonNull String pf_Title, @NonNull String pf_Sale) {
		super();
		this.pf_Info = pf_Info;
		this.pf_Title = pf_Title;
		this.pf_Sale = pf_Sale;
	}
	
	
	
}
