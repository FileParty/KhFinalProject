package com.kh.fp.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member_SH {

	private int m_no;
	private String m_name ;
	private String m_phone;
	private int m_level;
	private int m_point;
	
	
}
//
//m_no number(11) NOT NULL primary key,
//m_ID varchar2(200) NOT NULL UNIQUE,
//m_pw varchar2(100) NOT NULL,
//m_status CHAR DEFAULT 'N' CHECK(M_STATUS IN('Y','N')),
//m_nickname varchar2(50) NULL,
//m_enrolldate date DEFAULT SYSDATE,
//m_point number(20) DEFAULT 0,
//m_level number (20) default 1 ,
//m_phone varchar2(100),
//m_name varchar2(100)
