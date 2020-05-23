package com.kh.fp.model.vo;

import java.sql.Date;

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
	private String sd_array;
	private int r_score;
	private String m_email;
	private String me_name;
	private String me_img;
	private String r_img;
	private String r_reply;
}
