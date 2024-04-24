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
	

		
	    // 리뷰 식별자 
	    private Double review_Idx;
	    
	    // 리뷰 작성자 
		@NonNull 
		private String mb_Email;

	    // 의뢰 식별자 
	    private Double req_Idx;

	    // 리뷰 내용 

	    private String review_Content;
	    // 별점 

	    private int review_Ratings;

	    private String created_At;
	    
	    private String receiver;
	    
	    public Review(@NonNull String mb_Email, @NonNull String review_Content, int review_Ratings) {
			super();
			this.mb_Email = mb_Email;
			this.review_Content = review_Content;
			this.review_Ratings = review_Ratings;
		}

		public Review(String receiver) {
			super();
			this.receiver = receiver;
		}
	    
	    

		// 등록 일자 
		
}
