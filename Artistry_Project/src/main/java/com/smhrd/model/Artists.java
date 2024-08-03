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
    private String artist_profile_img;

    public Artists(String cate, int min_price, int max_price) {
        this.cate = cate;
        this.min_price = min_price;
        this.max_price = max_price;
    }

    public Artists(@NonNull String artist_email, @NonNull String artist_nick) {
        this.artist_email = artist_email;
        this.artist_nick = artist_nick;
    }

    // 명시적으로 추가된 getter 메서드
    public String getArtist_email() {
        return artist_email;
    }

    public String getCate() {
        return cate;
    }

    public int getMin_price() {
        return min_price;
    }

    public int getMax_price() {
        return max_price;
    }

    public String getArtist_nick() {
        return artist_nick;
    }

    public String getArtist_profile_img() {
        return artist_profile_img;
    }
    public Artists(@NonNull String artist_email, String cate, int min_price, int max_price) {
		super();
		this.artist_email = artist_email;
		this.cate = cate;
		this.min_price = min_price;
		this.max_price = max_price;
	}

	public Artists(@NonNull String artist_email, String cate, int min_price, int max_price, @NonNull String artist_nick,
			String artist_profile_img) {
		super();
		this.artist_email = artist_email;
		this.cate = cate;
		this.min_price = min_price;
		this.max_price = max_price;
		this.artist_nick = artist_nick;
		this.artist_profile_img = artist_profile_img;
	}
    
}
