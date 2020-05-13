package com.kh.fp.controller.menu;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fp.model.servier.menuDetail.MenuDatailService;
import com.kh.fp.model.vo.StoreMenu;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MenuDetailController {
	
	@Autowired
	private MenuDatailService service;
	
	@RequestMapping("/menu/menuDetailView")
	public ModelAndView menuDetail(ModelAndView mv, @RequestParam(defaultValue="1") int no) {
		log.debug("menu들어옴");
		mv.addObject("store",service.selectStroeDetailInfo(no));
		mv.setViewName("/menu/menuDetail");
		return mv;
	}
	
	@RequestMapping("/menu/menuDetailCategoryMenus")
	@ResponseBody
	public List<StoreMenu> menuDetailCategoryMenus(int no) {
		return service.selectCategoryMenu(no);
	}
	
	@RequestMapping("/menu/storeMenuSelectModalAjax")
	@ResponseBody
	public StoreMenu storeMenuSelectModalAjax(int no) {
		StoreMenu sm = service.selectMenuDetail(no);
		log.debug(""+sm);
		return sm;
	}

}
