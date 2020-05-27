package com.kh.fp.common.websocket;

import com.kh.fp.model.vo.Delivery;
import com.kh.fp.model.vo.Store;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class SocketMessage {

	private String type;	//배달자인지, 사업자 인지, 고객인지
	private int no; //orderno, deliveryno, clientno
	private String name; //가게명, 이름
	private String addr; //가게주소, 배달원 주소, 회원주소
	private String xl;  //위도
	private String yl;  //경도
	
	private String clientAddr;  //고객 주소
	
	
	private String state; //대기, 수락, 거절 (W, Y, N)
	private String msg;	//메시지
}
