package com.mss.k8s.p1.api.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mss.k8s.p1.api.model.PongResponse;

@RestController
public class FirstController {
	
	@GetMapping("/ping")
	public ResponseEntity<PongResponse> ping() {
		return new ResponseEntity<PongResponse>(new PongResponse("pong"), HttpStatus.OK);
	}

}
