package com.kh.fp.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Store {
	
	private int s_No;
	private String s_Addr;
	private String s_Name;
	private int s_LimitPrice;
	private String s_Paypot;
	private String s_Text;
	private String s_Phone;
	private String s_OpenStatus;
	private String s_EnrollStatus;
	private String s_OriFoodInfo;
	private String s_LogImg;
	private String s_X;
	private String s_Y;
	//private double S_SCORE;//
	private int s_Taste;
	private int s_Amount;
	private int s_Delivery;
	
	private int s_Time;
	private int s_ReviewCount;//
	private int b_No;
	private String s_Holiday;
	private String s_Coupon;
	private String s_StartTime;
	private String s_EndTime;
	
	//private String CT_NAME;
	//private double distance;
	//private String recentImg;
	
}
