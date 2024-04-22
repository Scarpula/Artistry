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
public class Payments {
		@NonNull
		private Double pay_Idx;
		@NonNull
	    private String mb_Email;
		@NonNull
	    private int req_Idx;
		@NonNull
	    private int total_Amount;
		@NonNull
	    private int discount_Amount;
		@NonNull
	    private int pay_Amount;
		@NonNull
	    private String pay_Method;
		@NonNull
	    private int paid_Amount;
		@NonNull
	    private String pay_Memo;

		private String payed_At;

		public Payments(@NonNull String mb_Email) {
			super();
			this.mb_Email = mb_Email;
		}
		
		
		
}


