package com.kh.fp.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	
	private int no;
	private String id;
	private String pw;
	private String status;
	private String nickname;
	private int point;
	

}
