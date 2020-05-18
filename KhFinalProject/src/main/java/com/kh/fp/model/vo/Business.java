package com.kh.fp.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Business {
	
	private int b_no;
	private String b_name;
	private String b_id;
	private String b_pw;
	private String b_businesscode;
	private char b_status;
	private String b_email;
	
	

}
