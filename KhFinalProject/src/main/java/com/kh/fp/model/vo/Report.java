package com.kh.fp.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Report {
	
	private int re_no;
	private int r_no;
	private int m_send;
	private String re_content;
	private int m_receiver;

}
