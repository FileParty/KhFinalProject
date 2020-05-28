package com.kh.fp.model.vo;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AdminApplyStore {
	
	private int s_No;
	private String s_Addr;
	private String s_Name;
	private String s_Text;
	private Date s_EnrollDate;
	private List<String> s_category;

}
