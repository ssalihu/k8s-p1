package com.mss.k8s.p1.api.model;

public class PongResponse {
	
	String message;

	public PongResponse(String message){
		this.message = message;
	}
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	

}
