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

		public Double getPay_Idx() {
			return pay_Idx;
		}

		public String getMb_Email() {
			return mb_Email;
		}

		public int getReq_Idx() {
			return req_Idx;
		}

		public int getTotal_Amount() {
			return total_Amount;
		}

		public int getDiscount_Amount() {
			return discount_Amount;
		}

		public int getPay_Amount() {
			return pay_Amount;
		}

		public String getPay_Method() {
			return pay_Method;
		}

		public int getPaid_Amount() {
			return paid_Amount;
		}

		public String getPay_Memo() {
			return pay_Memo;
		}

		public String getPayed_At() {
			return payed_At;
		}
		
		
		
}


