package com.kh.fp.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Business {
	
	private int b_No;
	private String b_Name;
	private String b_Id;
	private String b_Pw;
	private String b_BusinessCode;
	private char b_Status;
	private String b_Email;
	private Date b_Enrolldate;
	
	

}
