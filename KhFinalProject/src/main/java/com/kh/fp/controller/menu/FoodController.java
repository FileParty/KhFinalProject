package com.kh.fp.controller.menu;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.fp.model.vo.FoodCategory;

@Controller
public class FoodController {
	
	@RequestMapping("/food/foodlist.do")
	public String foodList(Model m) {
		
		FoodCategory category;
		ArrayList<FoodCategory> list = new ArrayList<FoodCategory>();
		
		for(int i=0; i<20; i++) {
			category = new FoodCategory("돌돌이 닭갈비", i, 244, 13000, 34);
			list.add(category);
		}
		
		
		m.addAttribute("list", list);
		return "foodlist";
	}
}
