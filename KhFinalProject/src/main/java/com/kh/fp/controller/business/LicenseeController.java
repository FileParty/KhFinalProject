package com.kh.fp.controller.business;

import static com.kh.fp.common.PageingFactory.PageBarFactory;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fp.controller.business.service.LicenseeService;

@Controller
public class LicenseeController {
	
	@Autowired
	LicenseeService service;
	
	@Autowired
	Logger logger;
	
	@RequestMapping("/licensee/mypage")
	public String myPage() {
		return "business/mypage";
	}
	@RequestMapping("/licensee/storeEnroll")
	public String storeEnroll() {
		//매장등록
		return "business/storeEnroll";
	}
	

	@RequestMapping("/licensee/menuStatus")
	public String menuStatus() {
		//메뉴운영
		return "business/menuStatus";
	}
	@RequestMapping("/licensee/menuEnroll")
	public String menuEnroll() {
		//메뉴등록
		return "business/menuEnroll";
	}
	
	@RequestMapping("/licensee/calculate")
	public String calculate() {
		//정산내역
		return "business/calculate";
	}
	
	@RequestMapping("/licensee/order")
	public ModelAndView order(ModelAndView mv,@RequestParam(required = false,defaultValue = "1")int cPage,
			@RequestParam(required = false ,defaultValue = "2")int numPerpage) {
		//주문내역
		int no=1;
		List<Map<String, Object>> list = service.getOrderInfo(no,cPage,numPerpage);
		int totalData=service.getOrderInfoAll(no);
		
		
		
		mv.addObject("total",totalData);
		mv.addObject("list", list);
		mv.addObject("pageBar", PageBarFactory( cPage, numPerpage, totalData,"/spring/licensee/order"));
		mv.setViewName("business/order");
		return mv;
	}
	
	@RequestMapping("/licensee/orderEnd")
	public String orderEnd() {
		//주문완료내역
		return "business/orderEnd";
	}
	@RequestMapping("/licensee/review")
	public String review() {
		//리뷰관리
		return "business/review";
	}
	
	@RequestMapping("/licensee/getdetailorder")
	public List<Map<String, Object>> getDetailOrder(int no){
		List<Map<String, Object>> data = service.getDetailOrder(no);
		return data;
	}
	

}
