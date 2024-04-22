package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
@AllArgsConstructor
@NoArgsConstructor
@RequiredArgsConstructor
@Getter
@Setter
public class ChatRoom {
	@NonNull
    private Double room_Idx;
	@NonNull
    private String mb_Email;
	@NonNull
    private String room_Title;
	@NonNull
    private String room_Info;
	
    private int room_Limit;
	
    private String room_Status;
	
	private String opened_At;

	public ChatRoom(@NonNull String mb_Email) {
		super();
		this.mb_Email = mb_Email;
	}
	
	
	
}
