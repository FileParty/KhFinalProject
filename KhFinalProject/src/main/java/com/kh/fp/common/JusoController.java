package com.kh.fp.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class JusoController {

	
	@RequestMapping("/juso/jusoxy")
	public String juso() {
		return "common/jusoPopupXY";
	}
	
}
