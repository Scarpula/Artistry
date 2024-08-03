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
	
	public Req(@NonNull String mb_Email) {
		super();
		this.mb_Email = mb_Email;
	}

	public Req(@NonNull String mb_Email, @NonNull String req_paper, @NonNull String req_img_path,
			@NonNull String req_receiver, @NonNull int req_price) {
		super();
		this.mb_Email = mb_Email;
		this.req_paper = req_paper;
		this.req_img_path = req_img_path;
		this.req_receiver = req_receiver;
		this.req_price = req_price;
	}

	public int getReq_idx() {
		return req_idx;
	}

	public String getMb_Email() {
		return mb_Email;
	}

	public String getReq_paper() {
		return req_paper;
	}

	public String getReq_img_path() {
		return req_img_path;
	}

	public String getReq_receiver() {
		return req_receiver;
	}

	public int getReq_price() {
		return req_price;
	}

	public String getCreated_at() {
		return created_at;
	}

	public Req(int req_idx, @NonNull String mb_Email, @NonNull String req_paper, @NonNull String req_img_path,
			@NonNull String req_receiver, @NonNull int req_price, String created_at) {
		super();
		this.req_idx = req_idx;
		this.mb_Email = mb_Email;
		this.req_paper = req_paper;
		this.req_img_path = req_img_path;
		this.req_receiver = req_receiver;
		this.req_price = req_price;
		this.created_at = created_at;
	}
	
	
	
	
}
