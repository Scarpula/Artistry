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
		private Double payIdx;
		@NonNull
	    private String mbEmail;
		@NonNull
	    private int reqIdx;
		@NonNull
	    private int totalAmount;
		@NonNull
	    private int discountAmount;
		@NonNull
	    private int payAmount;
		@NonNull
	    private String payMethod;
		@NonNull
	    private int paidAmount;
		@NonNull
	    private String payMemo;

		private String payedAt;
}
