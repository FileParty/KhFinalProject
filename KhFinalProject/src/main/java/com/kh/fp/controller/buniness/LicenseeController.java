package com.kh.fp.controller.buniness;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LicenseeController {
	
	@RequestMapping("/licensee/mypage")
	public String myPage() {
		return "sung/mypage";
	}
	@RequestMapping("/licensee/storeEnroll")
	public String storeEnroll() {
		//매장등록
		return "sung/storeEnroll";
	}
	@RequestMapping("/licensee/storeStatus")
	public String storeStatus() {
		//매장관리
		return "sung/storeStatus";
	}

	@RequestMapping("/licensee/menuStatus")
	public String menuStatus() {
		//메뉴운영
		return "sung/menuStatus";
	}
	@RequestMapping("/licensee/menuEnroll")
	public String menuEnroll() {
		//메뉴등록
		return "sung/menuEnroll";
	}
	@RequestMapping("/licensee/storeInfo")
	public String storeInfo() {
		//업체정보
		return "sung/storeInfo";
	}
	@RequestMapping("/licensee/storeInfoEnroll")
	public String storeInfoEnroll() {
		//업체정보등록
		return "sung/storeInfoEnroll";
	}
	@RequestMapping("/licensee/companyStatus")
	public String companyStatus() {
		//가맹점등록정보
		return "sung/companyStatus";
	}
	@RequestMapping("/licensee/companyEnroll")
	public String companyEnroll() {
		//가맹점등록
		return "sung/companyEnroll";
	}
	@RequestMapping("/licensee/calculate")
	public String calculate() {
		//정산내역
		return "sung/calculate";
	}
	@RequestMapping("/licensee/order")
	public String order() {
		//주문내역
		return "sung/order";
	}
	@RequestMapping("/licensee/orderEnd")
	public String orderEnd() {
		//주문완료내역
		return "sung/orderEnd";
	}
	@RequestMapping("/licensee/review")
	public String review() {
		//리뷰관리
		return "sung/review";
	}
	

}
