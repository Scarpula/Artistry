package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@AllArgsConstructor
public class Review {
    private Double review_Idx;
    @NonNull 
    private String mb_Email;
    private Double req_Idx;
    private String review_Content;
    private int review_Ratings;
    private String created_At;
    private String receiver;

    public Review(String receiver) {
        this.receiver = receiver;
    }

    public Review(@NonNull String mb_Email, String review_Content, int review_Ratings, String receiver) {
        this.mb_Email = mb_Email;
        this.review_Content = review_Content;
        this.review_Ratings = review_Ratings;
        this.receiver = receiver;
    }
    

	public Review(Double review_Idx, @NonNull String mb_Email, Double req_Idx, String review_Content,
			int review_Ratings, String created_At, String receiver) {
		super();
		this.review_Idx = review_Idx;
		this.mb_Email = mb_Email;
		this.req_Idx = req_Idx;
		this.review_Content = review_Content;
		this.review_Ratings = review_Ratings;
		this.created_At = created_At;
		this.receiver = receiver;
	}

	public Double getReview_Idx() {
		return review_Idx;
	}

	public String getMb_Email() {
		return mb_Email;
	}

	public Double getReq_Idx() {
		return req_Idx;
	}

	public String getReview_Content() {
		return review_Content;
	}

	public int getReview_Ratings() {
		return review_Ratings;
	}

	public String getCreated_At() {
		return created_At;
	}

	public String getReceiver() {
		return receiver;
	}
    
}
