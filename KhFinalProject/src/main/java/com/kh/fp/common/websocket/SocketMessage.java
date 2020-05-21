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
	private int storeNo;	//store 정보
	private int deliveryNo; //delivery 정보
	private String msg; //간단한 메시지
	private String sender;
	//사업자 -> 배달원 
	//배달원 -> 사업자
}
