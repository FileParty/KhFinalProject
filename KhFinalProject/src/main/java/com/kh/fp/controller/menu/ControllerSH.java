package com.kh.fp.controller.menu;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ControllerSH {

	@RequestMapping("/pay/paylist.do")
	public String payList() {
		return "SANGHAK/sh";
	}
	
}
