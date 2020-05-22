package com.kh.fp.common.websocket;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

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
		
		//session을 가지고 메세지를 보낸다.
		
		session.sendMessage(new TextMessage("배달 접속을 환영합니다."));
	}

	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// TODO Auto-generated method stub
		int storeNo = 0;
		String s_X = "";
		String s_Y = "";
		
		log.debug(message.getPayload());
		
		//현재 클라이언트 정보
		SocketMessage currentClient = getMessage(message.getPayload());
		
		log.debug("변환 후 " + currentClient);
		
		addClient(currentClient, session);
		
		switch(currentClient.getType()) {
		case "business":
			Set<Map.Entry<SocketMessage,WebSocketSession>> entry = clients.entrySet();
			Iterator<Map.Entry<SocketMessage, WebSocketSession>> it = entry.iterator();
			
			while(it.hasNext()) {
				Map.Entry<SocketMessage, WebSocketSession> en = (Map.Entry)it.next();
				
				System.out.println("key 값:" + en.getKey());
				System.out.println("value값 : " + en.getValue());
				
				SocketMessage so = (SocketMessage)en.getKey();
				if(so.getType().equals("delivery") && so.getState().equals("W")) {
					String deleveryXl = so.getXl();	//배달원 위도
					String deleveryYl = so.getYl(); //배달원 경도
					
					//거리 계산
					double dis =distance(Double.parseDouble(currentClient.getYl()), Double.parseDouble(currentClient.getYl()), Double.parseDouble(deleveryYl), Double.parseDouble(deleveryXl), "kilometer");
					//2km 이내에 배달원에게
					int count = 0;
					if(dis<2.0) {
						//2km 이내에 배달원에게 사업자 정보 보내기
						en.getValue().sendMessage(new TextMessage(getJsonMessage(currentClient)));
						
						//현재 접속자에게 배달원 정보 보내기
						//여기서 배달원 정보까지 보낼 필요는 없고 카운트만 세주면 되지 않을까?
						session.sendMessage(new TextMessage(getJsonMessage(en.getKey())));
					}
				}
			}
			
			break;
			
		case "delivery":
			break;
		}
	}


	//클라이언트 등록
	private void addClient(SocketMessage sm, WebSocketSession session) {
		this.clients.put(sm, session);
		log.info("접속자 : " + clients);
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
