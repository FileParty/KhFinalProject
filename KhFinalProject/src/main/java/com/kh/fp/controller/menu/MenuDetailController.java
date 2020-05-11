package com.kh.fp.controller.menu;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fp.model.servier.menuDetail.MenuDatailServiceImpl;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MenuDetailController {
	
	@RequestMapping("/menu/menuDetailView")
	public ModelAndView menuDetail(ModelAndView mv,@RequestParam(defaultValue="1") int no) {
		mv.setViewName("menu/menuDatail");
		return mv;
	}

}
