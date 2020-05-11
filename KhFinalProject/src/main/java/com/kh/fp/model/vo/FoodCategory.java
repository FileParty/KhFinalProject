package com.kh.fp.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FoodCategory {
	
	private String title;
	private double score;
	private int reviewCount;
	private int deleveryMinCharge;
	private int deleveryTime;
	private String category;
	private double km;
	private String logimg;
	private String recentimg;
	
}
