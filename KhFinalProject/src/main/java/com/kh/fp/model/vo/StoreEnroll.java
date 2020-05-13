package com.kh.fp.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class StoreEnroll {
	
	private String sname;
	private String saddr;
	private String phone1;
	private String phone2;
	private String phone3;
	private String[] category;
	private String slimitprice;
	private String spayopt;
	private String stext;
	private String sorifoodinfo;
	private int stime;
	private String[] sholiday;
	private String sholidaydetail;
	private double xl;
	private double yl;
	private String scoupon;
	private String sstarttime;
	private String sendtime;
}

