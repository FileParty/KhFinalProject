package com.kh.fp.controller.buniness;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;



@Controller
public class LicenseeController {
	
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
	public Map optionEnroll(String[] essential) {
		//추가옵션등록
		System.out.println("들어왔니?");
		System.out.println(essential.length);
		Map<String,Object> map = new HashMap();
		return map;
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
