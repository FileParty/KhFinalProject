package com.kh.fp.common.websocket;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

public class OrderAlert extends TextWebSocketHandler {

	Map<Object, WebSocketSession> clients = new HashMap<Object, WebSocketSession>();
	
	@Autowired
	ObjectMapper mapper;
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// TODO Auto-generated method stub
	}
	
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("옴");
		SocetMessageOrder msg = getMessage(message.getPayload());
		switch (msg.getType()) {
		case "user" : sendMessage(msg, session);break;
		case "business" : addClinet(msg, session); break;
		}
		sendMessage(msg,session);
		
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// TODO Auto-generated method stub
		super.afterConnectionClosed(session, status);
	}
	
	private SocetMessageOrder getMessage(String msg) {
		SocetMessageOrder message=null;
		try {
			message=mapper.readValue(msg, SocetMessageOrder.class);
		}catch(IOException e) {
			e.printStackTrace();
		}
		
		return message;
	}
	
	private void addClinet(SocetMessageOrder msg,WebSocketSession session) {
		clients.put(msg.getSender(), session);
		System.out.println(msg.getSender());
	}
	
	private void sendMessage(SocetMessageOrder msg,WebSocketSession session) {
		Set<Map.Entry<Object, WebSocketSession>> entry =  clients.entrySet();
		for(Map.Entry<Object,WebSocketSession> client : entry) {
			if(!msg.getReceiver().equals("")) {
				if(msg.getReceiver().equals(client.getKey())) {
					try {
						client.getValue().sendMessage(new TextMessage(getJsonMessage(msg)));
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
		}
	}
	
	private String getJsonMessage(SocetMessageOrder msg) {
		String jsonMsg="";
		try {
			jsonMsg =mapper.writeValueAsString(msg);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return jsonMsg;
	}
	
	
	
}
