package com.smhrd.model;

public class ChatHistory {

	private int id;
	private String senderId;
	private String receiverId;
	private String chatHistory;
	public String getSenderId() {
		return senderId;
	}
	public void setSenderId(String senderId) {
		this.senderId = senderId;
	}
	public String getReceiverId() {
		return receiverId;
	}
	public void setReceiverId(String receiverId) {
		this.receiverId = receiverId;
	}
	public String getChatHistory() {
		return chatHistory;
	}
	public void setChatHistory(String chatHistory) {
		this.chatHistory = chatHistory;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	
	
}
