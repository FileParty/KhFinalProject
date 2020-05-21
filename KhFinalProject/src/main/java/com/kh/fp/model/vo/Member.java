package com.kh.fp.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	
	private int m_No;
	private String m_Id;
	private String m_Pw;
	private String m_Status;
	private String m_Nickname;
	private Date m_Enrolldate;
	private int m_Point;
	private int m_Level;
	private String m_Phone;
	private String m_Name;
	private String m_Email;
	
	
	
	
	

}
