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

	private String type;	//배달자인지, 사업자 인지
	private String xl;	//위도
	private String yl; //경도
	private String state; //상태 (배달요청, 배달수락, 배달대기중, 배달 수락) , (N,Y) 대기(요청)W, (수락)Y, (거절)N
	private String sender;
	private String msg;	//메시지
	//사업자 -> 배달원 
	//배달원 -> 사업자
}
