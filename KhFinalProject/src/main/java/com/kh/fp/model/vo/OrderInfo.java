package com.kh.fp.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderInfo {

	
	
	private  int o_no;
	private String o_name;
	private String o_phone;
	private String o_recname;
	private String o_revphone;
	private String o_request;
	private String o_addr;
	private Date o_date;
	private int  o_oriprice;
	private int o_payprice;
	private char o_status;
	private int s_no; 
	private int m_no;
	
	
	
}
