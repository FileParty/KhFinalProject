package com.kh.fp.controller.menu;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fp.model.service.menuList.MenuListService;
import com.kh.fp.model.vo.MenuList;

@Controller
public class MenuListController {
	
//	private String title;
//	private double score;
//	private int reviewCount;
//	private int deleveryMinCharge;
//	private int deleveryTime;
//	private String listCategory;
//	private double km;
//	private String logimg;
//	private String recentimg;
	
	@Autowired
	private MenuListService service;
	
	@RequestMapping("/menu/menuList.do")
	public String foodList(Model m) {		
		List<MenuList> list = service.selectMenuList();
		
		/*
		 * for(int i=0; i<20; i++) { MenuList category = new MenuList("돌돌이 닭갈비", i, 244,
		 * 13000, 34,"몰라",0,"ss","ss"); list.add(category); }
		 */
				
		m.addAttribute("list", list);
			
		return "menu/menulist";
	}
	
	//카테고리 눌럿을때
	@RequestMapping("/menu/menuCategory.do")
	@ResponseBody
	public Map menuCategory(ModelAndView mv, 
			@RequestParam(value="menuCategory") String category
			) {
		
		List<MenuList> list = service.selectMenuList(category);
		
		Map<String, Object> map = new HashMap();
		map.put("list", list);
		
		return map;
	}
}
