package com.kh.fp.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		List<Map> aa = service.selectAdminMain();
		mv.addObject("AB",aa);
		mv.setViewName("/admin/main");
		return mv;
	}
	
	@RequestMapping("/admin/applyStoreList.do")
	public ModelAndView applyStoreList(ModelAndView mv, HttpServletRequest req) {
		List<AdminApplyStore> sList = service.selectApplyStoreList();
		mv.addObject("sList",sList);
		mv.setViewName("/admin/applyStoreList");
		
		if(req.getParameter("msg")==null) {
			mv.addObject("msg", "없음");
		}else if(req.getParameter("msg").equals("성공"))
			mv.addObject("msg", "성공");
		else if(req.getParameter("msg").equals("실패"))
			mv.addObject("msg", "실패");
		
		return mv;
	}
	
	@RequestMapping("/admin/applyStoreInfo")
	@ResponseBody
	public AdminApplyStoreInfo applyStoreInfo(@RequestParam int s_no) {
		return service.selectApplyStoreInfo(s_no);
	}
	
	@RequestMapping("/admin/updateStoreStatus.do")
	public ModelAndView updateStoreStatus(ModelAndView mv, HttpServletRequest req) {
		
		Map<String, String> map = new HashMap<String, String>();
		int flag = 0;
		
		for(int i=0; i<req.getParameterValues("s_no").length; i++) {
			int result = service.updateStoreStatus(Integer.parseInt(req.getParameterValues("s_no")[i]));
			if(result<=0) {
				flag++;
			}
		}
		
		if(flag<=0) mv.addObject("msg", "성공");
		else mv.addObject("msg", "실패");
		
		mv.setViewName("redirect:/admin/applyStoreList.do");
		return mv;
	}
	
	@RequestMapping("/admin/storeList.do")
	public ModelAndView storeList(ModelAndView mv, HttpServletRequest req) {
		List<AdminApplyStore> sList = service.selectStore();
		mv.addObject("sList",sList);
		mv.setViewName("/admin/storeList");
		
		if(req.getParameter("msg")==null) {
			mv.addObject("msg", "없음");
		}else if(req.getParameter("msg").equals("성공"))
			mv.addObject("msg", "성공");
		else if(req.getParameter("msg").equals("실패"))
			mv.addObject("msg", "실패");
		
		return mv;
	}
	
	@RequestMapping("/admin/deleteStoreStatus.do")
	public ModelAndView deleteStoreStatus(ModelAndView mv, HttpServletRequest req) {
		
		Map<String, String> map = new HashMap<String, String>();
		int flag = 0;
		
		for(int i=0; i<req.getParameterValues("s_no").length; i++) {
			int result = service.deleteStoreStatus(Integer.parseInt(req.getParameterValues("s_no")[i]));
			if(result<=0) {
				flag++;
			}
		}
		
		if(flag<=0) mv.addObject("msg", "성공");
		else mv.addObject("msg", "실패");
		
		mv.setViewName("redirect:/admin/storeList.do");
		return mv;
	}
	
	

}
