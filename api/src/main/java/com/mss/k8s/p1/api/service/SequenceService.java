package com.mss.k8s.p1.api.service;

import java.util.Arrays;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.mss.k8s.p1.api.model.Sequence;

@Service
public class SequenceService {

	@Value("${counter.service.url}")
	private String counterServiceEndPoint;

	public Sequence getID() {
		String uri = counterServiceEndPoint;

		RestTemplate restTemplate = new RestTemplate();

		HttpHeaders headers = new HttpHeaders();
		headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
		HttpEntity<String> entity = new HttpEntity<String>("parameters", headers);

		ResponseEntity<Sequence> result = restTemplate.exchange(counterServiceEndPoint, HttpMethod.GET, entity,
				Sequence.class);

		System.out.println(result);
		
		return result.getBody();

	}
}
