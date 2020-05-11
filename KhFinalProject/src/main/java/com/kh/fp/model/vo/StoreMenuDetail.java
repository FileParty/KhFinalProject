package com.kh.fp.model.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class StoreMenuDetail {
	
	private String s_name;
	private String s_addr;
	private int s_limitprice;
	private String s_payopt;
	private String s_text;
	private String s_phone;
	private String s_status;
	private String s_oriFood;
	private String s_logimg;
	private String s_x;
	private String s_y;
	private double s_score;
	private String s_time;
	private int s_reviewcount;
	private int b_no;
	private String s_holiday;
	private String s_cupone;
	private int s_startTime;
	private int s_endTime;
	private List<StroeCategory> scList;
	private List<StoreMenu> smList;
	

}
