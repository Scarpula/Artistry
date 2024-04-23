package com.smhrd.model;

import lombok.Getter;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@RequiredArgsConstructor
@Setter
@Getter
@ToString
public class Port {
	
	private int idx;
	@NonNull private String pf_Path;
	@NonNull private String mb_Email;
	@NonNull private String pf_Name;
	@NonNull private String pf_Cate;
	@NonNull private String pf_Info;
	
	
}
