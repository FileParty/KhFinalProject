package com.kh.fp.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MenuDetailOrder {
	
	private String src;
	private String name;
	private MenuDetailOrderReqOp MenuDetailOrderReqOp;
	private MenuDetailOrderUnReqOp[] MenuDetailOrderUnReqOp;
	private int count;
	private int price;

}
