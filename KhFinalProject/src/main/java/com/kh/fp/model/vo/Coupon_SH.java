package com.kh.fp.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Coupon_SH {
	private int cn_no;			
	private Date cn_enrolldate;	//발행일자
	private Date cn_expire;		//만료일자
	private int cn_price;		//쿠폰가격
	private int m_no;
	private int cn_limitprice;		//가격 이상부터 쓸수있따.
	private String cn_name;			//쿠폰이름

	
}
//cn_no number(11) NOT NULL primary key,
//cn_enrolldate date NOT NULL,
//cn_expire date NOT NULL,
//cn_price number(20) NOT NULL,
//m_no number(11) NOT NULL,
//cn_limitprice number(20)NOT NULL,
//cn_name varchar(100) not null,
