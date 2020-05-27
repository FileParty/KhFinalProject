package com.kh.fp.model.vo;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReviewAll {

	private int r_no;
	private String r_text;
	private int r_score_taste;
	private int r_score_amout;
	private int r_score_delivery;
	private Date r_date;
	private int m_no;
	private int s_no;
	private int o_no;
	private int r_score;
	private List<String> r_img;
	private List<MenuDetailReviewMenu> order_menu;
	private String r_reply;
	private String m_nickname;
	
}
