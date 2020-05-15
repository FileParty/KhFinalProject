package com.kh.fp.controller.business;

import static com.kh.fp.common.PageingFactory.PageBarFactory;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fp.controller.business.service.LicenseeService;
import com.kh.fp.model.vo.MenuCategory;

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
	@RequestMapping("/licensee/menuEnrollEnd")
	public String menuEnroll(HttpServletRequest req) {
		//메뉴등록
		String[] cateEnd = req.getParameterValues("categoryEnd");
		String[] menuName = req.getParameterValues("menuName");
		String[] mPrice = req.getParameterValues("menuPrice");
		String[] img = req.getParameterValues("menuImg");
		String[] detail = req.getParameterValues("menuDetail");
		String[] end = req.getParameterValues("end");
		String[] rPrice = req.getParameterValues("rPrice");
		String[] checked = req.getParameterValues("checked");
		String[] ePrice = req.getParameterValues("endPrice");
		int menuPrice[] = new int[mPrice.length];
		int rrPrice[] = new int[rPrice.length];
		int endPrice[] = new int[ePrice.length];

		
		for(int i=0;i<img.length;i++) {
			
			System.out.println("파일"+img[i]);
			//메뉴가격
		}
		
		for(int i=0;i<mPrice.length;i++) {
			menuPrice[i]= Integer.parseInt(mPrice[i]);
			System.out.println("메뉴가격"+menuPrice[i]);
			//메뉴가격
		}
		for(int i=0;i<rPrice.length;i++) {
			rrPrice[i]= Integer.parseInt(rPrice[i]);
			System.out.println("필수가격"+rrPrice[i]);
			//필수 가격
		}
		for(int i=0;i<ePrice.length;i++) {
			endPrice[i]= Integer.parseInt(ePrice[i]);
			System.out.println("선택가격"+endPrice[i]);
			//선택 가격
		}
		for(int i=0;i<cateEnd.length;i++) {
			System.out.println(cateEnd[i]);
		}
		return "";
	}
	
	@RequestMapping("/licensee/optionEnroll")
	public String optionEnroll(HttpServletRequest req) {
		//추가옵션등록
		String[] ess = req.getParameterValues("sd_name");
		String[] price = req.getParameterValues("sd_price");
		String[] division = req.getParameterValues("sd_division");
		
		int[] prc = new int[price.length];
		for(int i=0;i<price.length;i++) {
			prc[i] = Integer.parseInt(price[i]);
		}

		for(int i=0;i<ess.length;i++) {
			Map<String, Object> map = new HashMap();
			map.put("sd_name",ess[i]);
			map.put("sd_price",prc[i]);
			map.put("sd_division",division[i]);
			int result = service.insertSide(map);
		}

		return "";
	}
	@RequestMapping("/licensee/categoryEnroll")
	public String categoryEnroll(HttpServletRequest req) {
		//카테고리등록
		String[] category = req.getParameterValues("category");
		for(int i=0;i<category.length;i++) {
		Map<String,Object> map = new HashMap();
		map.put("mt_name",category[i]);
		int result = service.insertCategory(map);
		}
		return "";
	}
	@RequestMapping("/licensee/selectCategory")
	@ResponseBody
	public List<MenuCategory> selectCategory(HttpServletRequest req) {
		//카테고리조회
		List<MenuCategory> list = service.selectCategory();
		return list;
	}
	
	

}
