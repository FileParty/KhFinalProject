package com.kh.fp.controller.admin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fp.model.service.admin.AdminService;
import com.kh.fp.model.vo.AdminApplyStore;
import com.kh.fp.model.vo.AdminApplyStoreInfo;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	
	@RequestMapping("/admin/adminMain.do")
	public ModelAndView adminMainPage(ModelAndView mv) {
		mv.setViewName("/admin/main");
		return mv;
	}
	
	@RequestMapping("/admin/applyStoreList")
	public ModelAndView applyStoreList(ModelAndView mv) {
		List<AdminApplyStore> sList = service.selectApplyStoreList();
		mv.addObject("sList",sList);
		mv.setViewName("/admin/applyStoreList");
		return mv;
	}
	
	@RequestMapping("/admin/applyStoreInfo")
	@ResponseBody
	public AdminApplyStoreInfo applyStoreInfo(@RequestParam int s_no) {
		return service.selectApplyStoreInfo(s_no);
	}
	
	@RequestMapping("/admin/updateStoreStatus.do")
	public ModelAndView updateStoreStatus(@RequestParam Map<String, String> map, ModelAndView mv, HttpServletRequest req) {
		
		
		for(int i=0; i<req.getParameterValues("s_no").length; i++) {
			
			
			System.out.println("데이터: " + req.getParameterValues("s_no")[i]);
		}
		
		mv.setViewName("redirect:/admin/applyStoreList");
		
		return mv;
	}

}
