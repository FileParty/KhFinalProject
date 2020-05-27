package com.kh.fp.common.websocket;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.TimerTask;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class DeliveryServer extends TextWebSocketHandler{

	private Map<SocketMessage, WebSocketSession> clients = new HashMap();
	
	
	//json객체 -> 자바객체, 자바객체 -> json 객체로 변환해주는 jackson 제공 객체
	@Autowired
	ObjectMapper mapper;

	//jsp에서 new WebSocket(주 소)가 실행되어 접속 요청을 하면 실행되는 메소드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// TODO Auto-generated method stub
		log.debug("사용자 접속");
		log.debug(session+"");
		//session을 가지고 메세지를 보낸다.
		
		//session.sendMessage(new TextMessage(getJsonMessage(new SocketMessage("server",0,"서버","","","","","","환영합니다."))));
	}

	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// TODO Auto-generated method stub
		log.debug(message.getPayload());
	
		SocketMessage msg = getMessage(message.getPayload());
		
		switch(msg.getType()) {
			case "business":
				if(msg.getState().equals("W")) {
					addClient(msg,session);
					sendMessage(msg,session);
				}
				break;
				
			case "delivery":
				if(msg.getState().equals("W")) {
					addClient(msg,session);
				}
				
				if(msg.getState().equals("Y")) {
					log.debug("배달원이 수락했을 때 찍히나요");
					sendMessage(msg,session);
				}
				break;
		}
	}


	//클라이언트 등록
	private void addClient(SocketMessage sm, WebSocketSession session) {
		this.clients.put(sm, session);
		log.info("접속자 : " + clients);
	}
	
	private void sendMessage(SocketMessage msg, WebSocketSession session) {
		//클라이언트가 보낸 데이터 보내기
		
		Set<Map.Entry<SocketMessage, WebSocketSession>> entry = clients.entrySet();
		
		for(Map.Entry<SocketMessage, WebSocketSession> client : entry) {
			
				log.debug("key값:" + client.getKey());
				log.debug("value값:" + client.getValue());
				
			try {	
				//사업자가 로그인했을 때
				int count =0;
				
				switch(msg.getType()) {
				case "business":
					if(client.getKey().getType().equals("delivery") && client.getKey().getState().equals("W")) {	//서버에 접속한 유저중 배달원에 해당하는 경우
						client.getKey().setState("W2");
						
						client.getValue().sendMessage(new TextMessage(getJsonMessage(msg)));
						
						session.sendMessage(new TextMessage(getJsonMessage(new SocketMessage("server",0,"","","","","","",++count+" 명의 배달원을 찾았습니다."))));
					}
					break;
					
				case "delivery":
					//배달원이 로그인했을 때
					if(client.getKey().getType().equals("business") && client.getKey().getState().equals("W")) {
						if(client.getKey().getNo() == msg.getNo()) {
							log.debug("접속자 no값"+client.getKey().getNo());
							log.debug("현재 클라이언트 no값" + msg.getNo());
							log.debug("현재 클라이언트 type" + msg.getType());
							log.debug("현재 클라이언트 이름" + msg.getName());
							log.debug("현재 클라이언트 message" + msg.getMsg());
							
					
							client.getValue().sendMessage(new TextMessage(getJsonMessage(msg)));
						}
					}
					break;
				}
				
				
				/*
				 * if(client.getKey().getType().equals("delivery") &&
				 * client.getKey().getState().equals("Y")) { session.sendMessage(new
				 * TextMessage(getJsonMessage(msg))); }
				 */
				
				
				/*
				 * if(client.getKey().getType().equals("business") &&
				 * client.getKey().getState().equals("W")) { if(client.getKey().get) }
				 */
			}catch(IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	//자바스크립트에서 보낸 메시지 변환
	private SocketMessage getMessage(String msg) {
		SocketMessage message = null;
		try {
			message = mapper.readValue(msg, SocketMessage.class);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return message;
	}
	
	//객체를 json으로 바꾸기
	private String getJsonMessage(SocketMessage msg) {
		String jsonMsg = "";
		try {
			jsonMsg = mapper.writeValueAsString(msg);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return jsonMsg;
	}
	
	//거리 계산
	private static double distance(double lat1, double lon1, double lat2, double lon2, String unit) {
        
        double theta = lon1 - lon2;
        double dist = Math.sin(deg2rad(lat1)) * Math.sin(deg2rad(lat2)) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.cos(deg2rad(theta));
         
        dist = Math.acos(dist);
        dist = rad2deg(dist);
        dist = dist * 60 * 1.1515;
         
        if (unit == "kilometer") {
            dist = dist * 1.609344;
        } else if(unit == "meter"){
            dist = dist * 1609.344;
        }
 
        return (dist);
    }

	// This function converts decimal degrees to radians
    private static double deg2rad(double deg) {
        return (deg * Math.PI / 180.0);
    }
     
    // This function converts radians to decimal degrees
    private static double rad2deg(double rad) {
        return (rad * 180 / Math.PI);
    }

}

