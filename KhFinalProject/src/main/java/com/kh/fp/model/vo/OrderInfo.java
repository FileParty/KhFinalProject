package com.kh.fp.model.vo;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderInfo {
	
	private int o_no;
	private String o_status;
	private Date o_date;
	private String o_addr;
	private String date;
	private String price;
	private int o_oriprice;
	private String o_name;
	private String o_phone;
	private String o_request;
	private List o_menu;	
	
}
