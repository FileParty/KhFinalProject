package com.kh.fp.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Menu {

	private int me_no;
	private String me_name;
	private int me_price;
	private String me_logImg;
	private int mt_no;
	private String me_text;
	private String me_best;
	private int s_no;
	
	
}
