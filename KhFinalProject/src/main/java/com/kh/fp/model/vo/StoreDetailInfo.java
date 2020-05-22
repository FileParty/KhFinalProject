package com.kh.fp.model.vo;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class StoreDetailInfo {
	
	private int s_no;
	private String s_addr;
	private String s_name;
	private int s_limitprice;
	private String s_payopt;
	private String s_text;
	private String s_phone;
	private String s_openStatus;
	private String s_enrollStatus;
	private String s_oriFoodInfo;
	private String s_logimg;
	private double s_star;
	private String s_time;
	private int s_reviewCount;
	private int b_no;
	private String s_holiday;
	private String s_coupon;
	private Date s_startTime;
	private Date s_endTime;
	private String b_businesscode;
	private double s_taste_tru;
	private double s_amount_tru;
	private double s_delivery_tru;
	private List<StoreCategory> storeCategory;
	private List<StoreMenu> bestMenu;
	

}
