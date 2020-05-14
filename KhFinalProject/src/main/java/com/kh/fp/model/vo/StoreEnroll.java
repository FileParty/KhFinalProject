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
	private int slimitprice;
	private String spayopt;
	private String stext;
	private String sorifoodinfo;
	private String stime;
	private String[] sholiday;
	private String xl;
	private String yl;
	private char scoupon;
	private String sstarttime;
	private String sendtime;
	private String logimg;
	private int bno;
	private int sno;
}

