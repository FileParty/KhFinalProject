package com.kh.fp.model.vo;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class StoreDetailReview {
	
	private int r_no;
	private String r_text;
	private int r_score_taste;
	private int r_score_amount;
	private int r_score_delivery;
	private Date r_date;
	private int m_no;
	private int s_no;
	private String m_nickName;
	private List<String> r_imgs;

}
