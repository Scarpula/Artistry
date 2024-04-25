package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@RequiredArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class Req {

	
	private int req_idx;
	@NonNull private String mb_Email;
	@NonNull private String req_paper;
	@NonNull private String req_img_path;
	@NonNull private String req_receiver;
	@NonNull private int req_price;
	private String created_at;
	

	
	
	
	
	
	
	
	
}
