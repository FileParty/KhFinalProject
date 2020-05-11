package com.kh.fp.controller.menu;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FoodDetailController {
	
	@RequestMapping("/menu/menuDetail")
	public ModelAndView menuDetail(ModelAndView mv,@RequestParam(defaultValue="1") int no) {
		mv.setViewName("menu/menuDatail");
		return mv;
	}

}
