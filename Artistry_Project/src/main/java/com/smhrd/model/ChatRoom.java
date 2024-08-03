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

	public Double getRoom_Idx() {
		return room_Idx;
	}

	public String getMb_Email() {
		return mb_Email;
	}

	public String getRoom_Title() {
		return room_Title;
	}

	public String getRoom_Info() {
		return room_Info;
	}

	public int getRoom_Limit() {
		return room_Limit;
	}

	public String getRoom_Status() {
		return room_Status;
	}

	public String getOpened_At() {
		return opened_At;
	}
	
	
	
	
}
