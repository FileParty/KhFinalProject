package com.kh.fp.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	
	private int m_no;
	private String m_id;
	private String m_pw;
	private String m_status;
	private String m_nickname;
	private Date m_enrolldate;
	private int m_point;
	private int m_level;
	private String m_phone;
	private String m_name;
	private String m_email;
	
	
	
	
	

}
