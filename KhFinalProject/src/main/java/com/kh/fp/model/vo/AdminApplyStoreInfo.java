package com.kh.fp.model.vo;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AdminApplyStoreInfo {
	
	private int s_no;
	private String s_addr;
	private String s_name;
	private String s_text;
	private int s_limitprice;
	private String s_payopt;
	private String s_phone;
	private String s_orifoodinfo;
	private String s_logimg;
	private int s_time;
	private String s_holiday;
	private String s_coupon;
	private Date s_startTime;
	private Date s_endTime;
	private Date s_enrollDate;
	private String b_name;
	private String b_businesscode;
	private String b_email;
	private List<String> s_category;

}
