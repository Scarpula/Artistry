package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@RequiredArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class Artists {
	@NonNull
	private String artist_email;
	private String cate;
	private int min_price;
	private int max_price;
	@NonNull
	private String artist_nick;
	public Artists(String cate, int min_price, int max_price) {
		super();
		this.cate = cate;
		this.min_price = min_price;
		this.max_price = max_price;
	}
	public Artists(@NonNull String artist_email, String cate, int min_price, int max_price) {
		super();
		this.artist_email = artist_email;
		this.cate = cate;
		this.min_price = min_price;
		this.max_price = max_price;
	}
	
}
