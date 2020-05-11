package com.kh.fp.controller.menu;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fp.model.servier.menuDetail.MenuDatailService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MenuDetailController {
	
	@Autowired
	private MenuDatailService service;
	
	@RequestMapping("/menu/menuDetailView")
	public ModelAndView menuDetail(ModelAndView mv, @RequestParam(defaultValue="1") int no) {
		log.debug("menu들어옴");
		mv.addObject("store",service.selectStroeInfo(no));
		mv.setViewName("/menu/menuDetail");
		return mv;
	}

}
