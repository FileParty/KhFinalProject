package com.kh.fp.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Review {

	private int R_NO;
	private String R_TEXT;
	private int R_SCORE_TASETE;
	private int R_SCORE_AMOUNT;
	private int R_SCORE_DELIVERY;
	private Date R_DATE;
	private int M_NO;
	private int S_NO;
	private String R_REPLY;
}
