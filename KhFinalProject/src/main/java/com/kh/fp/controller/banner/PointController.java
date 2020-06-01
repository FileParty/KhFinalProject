package com.kh.fp.controller.banner;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PointController {
	
	@RequestMapping("/banner/point")
	public String point() {
		return "banner/point";
	}
	
	@RequestMapping("/banner/enrollMember")
	public String enrollMember() {
		return "member/memberEnroll1";
	}
}
