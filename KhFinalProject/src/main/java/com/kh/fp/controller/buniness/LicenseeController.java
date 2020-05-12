package com.kh.fp.controller.buniness;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.fp.service.buniness.LicenseeService;



@Controller
public class LicenseeController {
	
	@Autowired
	private LicenseeService service;
	
	@RequestMapping("/licensee/mypage")
	public String myPage() {
		return "business/mypage";
	}
	@RequestMapping("/licensee/storeEnroll")
	public String storeEnroll() {
		//매장등록
		return "business/storeEnroll";
	}
	@RequestMapping("/licensee/storeStatus")
	public String storeStatus() {
		//매장관리
		return "business/storeStatus";
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
	@RequestMapping("/licensee/optionEnroll")
	public String optionEnroll(HttpServletRequest req) {
		//추가옵션등록
		String[] ess = req.getParameterValues("sd_name");
		String[] price = req.getParameterValues("sd_price");
		String div = req.getParameter("sd_division");
		int[] prc = new int[price.length];
		List<Map<String,Object>> list = new ArrayList();
		Map<String,Object> map = new HashedMap();
		for(int i=0;i<ess.length;i++) {
			prc[i] = Integer.parseInt(price[i]);
		}
		for(int i=0;i<ess.length;i++) {
		map.put("sd_name",ess[i]);
		map.put("sd_price",prc[i]);
		map.put("sd_division",div);
		list.add(map);
		System.out.println(list.get(i));
		}
		
		System.out.println("map"+map);
		int result = service.insertSide(list);
		
		return "";
	}
	
	@RequestMapping("/licensee/storeInfo")
	public String storeInfo() {
		//업체정보
		return "business/storeInfo";
	}
	@RequestMapping("/licensee/storeInfoEnroll")
	public String storeInfoEnroll() {
		//업체정보등록
		return "business/storeInfoEnroll";
	}
	@RequestMapping("/licensee/companyStatus")
	public String companyStatus() {
		//가맹점등록정보
		return "business/companyStatus";
	}
	@RequestMapping("/licensee/companyEnroll")
	public String companyEnroll() {
		//가맹점등록
		return "business/companyEnroll";
	}
	@RequestMapping("/licensee/calculate")
	public String calculate() {
		//정산내역
		return "business/calculate";
	}
	@RequestMapping("/licensee/order")
	public String order() {
		//주문내역
		return "business/order";
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
	

	

}
