package com.kh.fp.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Side {
	
	private int sd_no;
	private String[] sd_name;
//	private String[] sd_name2;
	private int[] sd_price;
//	private int[] sd_price2;
	private int s_no;
	private String sd_division;
}
