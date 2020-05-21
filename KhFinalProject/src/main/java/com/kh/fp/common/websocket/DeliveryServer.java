package com.kh.fp.common.websocket;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class DeliveryServer extends TextWebSocketHandler{

	private Map<String, WebSocketSession> clients = new HashMap();
	
	//json객체 -> 자바객체, 자바객체 -> json 객체로 변환해주는 jackson 제공 객체
	@Autowired
	ObjectMapper mapper;

	//jsp에서 new WebSocket(주 소)가 실행되어 접속 요청을 하면 실행되는 메소드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// TODO Auto-generated method stub
		log.debug("사용자 접속");
		
		//session을 가지고 메세지를 보낸다.
		
		session.sendMessage(new TextMessage("배달 접속을 환영합니다."));
	}

	//클라이언트 등록
	private void addClient(SocketMessage sm, WebSocketSession session) {
		this.clients.put(sm.getSender(), session);
		
		
	}
	
	
}
