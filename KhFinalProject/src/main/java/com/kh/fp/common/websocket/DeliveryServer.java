package com.kh.fp.common.websocket;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.TimerTask;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
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
				
				//배달원에게 음식을 주고 배달출발을 했을 때
				if(msg.getState().equals("S"))
					//배달원의 상태값을 배달중으로 바꾸기 위해
					//배달원에게 메시지 전송
					//고객에게 배달이 시작했다고 메시지 전송
					sendMessage(msg,session);
				break;
				
			case "delivery":
				if(msg.getState().equals("W")) {
					addClient(msg,session);
				}
				
				if(msg.getState().equals("Y")) {
					log.debug("배달원이 수락했을 때 찍히나요");		
					sendMessage(msg,session);
				}
				
				//배달원이 배달을 완료했을 때
				if(msg.getState().equals("C")) {
					log.debug("배달원이 배달을 완료했을때 찍히나요");
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
						String businessXl = msg.getXl();
						String businessYl = msg.getYl();
						String deliveryXl = client.getKey().getXl();
						String deliveryYl = client.getKey().getYl();
						
						log.debug(businessXl);
						log.debug(businessYl);
						log.debug(deliveryXl);
						log.debug(deliveryYl);
						
						double dis = distance(Double.parseDouble(businessYl), Double.parseDouble(businessXl), Double.parseDouble(deliveryYl), Double.parseDouble(deliveryXl), "kilometer");
						
						log.debug("거리 " + dis);
						
						if(3>dis) {
							client.getKey().setState("W2");
							
							//배달원에게 사업자의 정보 전송(사업자 W 일때)
							client.getValue().sendMessage(new TextMessage(getJsonMessage(msg)));
							
							session.sendMessage(new TextMessage(getJsonMessage(new SocketMessage("server",0,"","","","","","",++count+" 명의 배달원을 찾았습니다."))));
						}
					}
					
					//사업자가 출발 눌렀을 때
					if(msg.getState().equals("S")) {
						//해당하는 사업자의 상태값을 S로 변경해야 한다.
						if(session.getId().equals(client.getValue().getId())) {
							client.getKey().setState("S");
							log.debug("사업자 상태 : " + client.getKey().getState());
						}
						
						//배달자한테 사업자의 메시지를 전송해야 함
						//수락을 눌렀다는 사실을 배달자한테 알려줌
						if(client.getKey().getType().equals("delivery") && client.getKey().getState().equals("Y")) {
							//배달원한테 사업자의 메시지 전송(사업자 S 일때)
							//배달원의 상태값을 변경해줌 S 로
							if(msg.getNo() == client.getKey().getNo()) {
								//해당하는 배달원의 상태값만 변경해줘야되
								client.getKey().setState("S");	
								//해당하는 배달원한테만 메세지 전송
								log.debug("사업자가 출발버튼 눌렀을 때 배달원에게 보내는 메시지"+msg.getState());
								client.getValue().sendMessage(new TextMessage(getJsonMessage(msg)));
							}
						}
						
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
					
					if(msg.getState().equals("Y")) {
						//배달자가 수락 눌렀을 때 no 값을 변경해야 한다.
						if(session.getId().equals(client.getValue().getId())) {
							client.getKey().setNo(msg.getNo());;
							log.debug("배달자의 no: " + client.getKey().getNo());
						}
						
						//배달자가 수락 눌렀을 때 상태값 Y로 변경해야 한다.
						if(session.getId().equals(client.getValue().getId())) {
							client.getKey().setState("Y");
							log.debug("배달자의 상태 : " + client.getKey().getState());
						}
						
						//사업자의 상태도 Y로 바꿔줘야 한다.
						if(client.getKey().getType().equals("business") && client.getKey().getNo()==msg.getNo()){
							client.getKey().setState("Y");
							log.debug("사업자의 정보 : " + client.getKey());
						}
					}
					
					if(msg.getState().equals("S")) {
						if(session == client.getValue()) {
							log.debug("클라이언트의 상태 변경 전");
							log.debug(""+client.getKey().getState());
							
							client.getKey().setState("S");
						}
					}
					
					if(msg.getState().equals("C")) {
						log.debug("배달 완료 했을 때 찍혀야 합니다.");
						
						//사업자한테 보내야함
						//배달 출발 누른 사업자한테만 보내야함.
						if(client.getKey().getType().equals("business") && client.getKey().getState().equals("S")) {
							if(client.getKey().getNo() == msg.getNo()) {
								log.debug("접속자 no값"+client.getKey().getNo());
								log.debug("현재 클라이언트 no값" + msg.getNo());
								log.debug("현재 클라이언트 type" + msg.getType());
								log.debug("현재 클라이언트 이름" + msg.getName());
								log.debug("현재 클라이언트 message" + msg.getMsg());
								
								client.getValue().sendMessage(new TextMessage(getJsonMessage(msg)));
							}
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


	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// TODO Auto-generated method stub
		log.debug("세션이 끊어졌습니다.");
		log.debug("세션 값"+session);
		log.debug("접속자: " + clients);
	}

    
    
}

