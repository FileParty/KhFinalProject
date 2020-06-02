package com.kh.fp.common.websocket;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SocetMessageOrder {

	private String receiver;
	private String sender;
	private	String msg;
	private String type;
	
}
