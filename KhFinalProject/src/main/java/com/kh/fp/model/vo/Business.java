package com.kh.fp.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Business {
	
	private int b_no;
	private String b_name;
	private String b_id;
	private String b_pw;
	private String b_businesscode;
	
	private int S_NO;
	private String S_ADDR;
	private String S_NAME;
	private int S_LIMITPRICE;
	private String S_PAYOPT;
	private String S_TEXT;
	private String S_PHONE;
	private String S_OPENSTATUS;
	private String S_ENROLLSTATUS;
	private String S_ORIFOODINFO;
	private String S_LOGIMG;
	private String S_X;
	private String S_Y;
	private double S_SCORE;//
	private int S_TIME;
	private int S_REVIEWCOUNT;//
	private String S_HOLIDAY;
	private String S_COUPON;
	private Date S_STARTTIME;
	private Date S_ENDTIME;

}
