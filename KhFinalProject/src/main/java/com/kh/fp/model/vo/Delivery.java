package com.kh.fp.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Delivery {

	private int m_No;
	private String d_Status;
	private String d_X;
	private String d_Y;
	private int o_No;
	private String store_Name;
	private String store_Address;
	private String client_Address;
}
