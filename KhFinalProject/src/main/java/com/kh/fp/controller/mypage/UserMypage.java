package com.kh.fp.controller.mypage;

import static com.kh.fp.common.PageingFactory.PageBarFactory;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.fp.model.service.mypage.MypageService;
import com.kh.fp.model.vo.Member;

@Controller
public class UserMypage {
	
	@Autowired
	private MypageService service;
	
	@RequestMapping("/mypage/mypage.do")
	public String mypage() {
		return "mypage/userMypage";
	}
	
	@RequestMapping("/mypage/orderHistory.do")
	public String orderHistory(@RequestParam Map map, HttpSession session, Model m) {
		
//		session.getAttribute();
		Member LoginMember = (Member)session.getAttribute("LoginMember");
		
		LoginMember = new Member();
		LoginMember.setM_no(1);
		
		
		int cPage=1;
		
		try {
			cPage = (int)map.get("cPage");
		}catch(Exception e) {
		}
		int numPerPage = 5;
		int totalData = service.getTotalCount(LoginMember.getM_no());
		String url = "/mypage/orderHistory.do";
		
		List<Map<String, String>> list = service.selectOrder(LoginMember.getM_no(), cPage, numPerPage);
		
		String pageBar = PageBarFactory(cPage, numPerPage, totalData, url);
		
		System.out.println(totalData);
		
		m.addAttribute("list", list);
		m.addAttribute("pageBar", pageBar);
		
		
				
		return "mypage/mypage_orderHistory";
	}
	
	@RequestMapping("/mypage/orderMenu.do")
	@ResponseBody
	public List<Map<String, String>> selectOrderMenu(int o_no) {
		
		List<Map<String, String>> list = service.selectOrderMenu(o_no);
		
		Map<String, String> map1 = new HashMap<String, String>();
		Map<String, String> map2 = new HashMap<String, String>();  
		map1.put("1_1", "11");
		map1.put("1_2", "12");
		map1.put("1_3", "13");
		
		map2.put("2_1", "21");
		map2.put("2_2", "22");
		map2.put("2_3", "23");
		map2.put("2_4", "24");
		
		list.add(map1);
		list.add(map2);
		
		return list;
	}
	
	@RequestMapping("/mypage/review.do")
	public String review(HttpSession session, @RequestParam Map map, Model m) {
		
		Member LoginMember = (Member)session.getAttribute("LoginMember");
		
		LoginMember = new Member();
		LoginMember.setM_no(1);
		
		
		int cPage=1;
		
		try {
			cPage = (int)map.get("cPage");
		}catch(Exception e) {
		}
		int numPerPage = 5;
		int totalData = service.reviewTotalCount(LoginMember.getM_no());
		String url = "/mypage/review.do";
		
		List<Map<String, String>> list = service.selectReview(LoginMember.getM_no(), cPage, numPerPage);
		
		String pageBar = PageBarFactory(cPage, numPerPage, totalData, url);
		
		m.addAttribute("list", list);
		m.addAttribute("pageBar", pageBar);
		
		return "mypage/mypage_review";
	}
	
	@RequestMapping("/mypage/reviewImg.do")
	@ResponseBody
	public List<String> reviewImg(@RequestParam Map<String, String> map) {
		return service.selectReviewImg(map);
	}
	
	@RequestMapping("/mypage/watchList.do")
	public String watchList(HttpSession session, Model m) {
		
		Member LoginMember = (Member)session.getAttribute("LoginMember");
		
		LoginMember = new Member();
		LoginMember.setM_no(1);
		
		List<Map<String, String>> list = service.selectPrefer(LoginMember.getM_no());
		
		m.addAttribute("list", list);
		
		return "mypage/mypage_watchList";
	}
	
	@RequestMapping("/mypage/delectWatchList.do")
	@ResponseBody
	public int delectWatchList(@RequestParam Map<String, String> map) {
		return service.delectWatchList(map);
	}
	
	@RequestMapping("/mypage/couponAndPoint.do")
	public String couponAndPoint(HttpSession session, Model m) {
		
		Member LoginMember = (Member)session.getAttribute("LoginMember");
		
		LoginMember = new Member();
		LoginMember.setM_no(1);
		
		List<Map<String, String>> list = service.selectCoupon(LoginMember.getM_no());
		
		m.addAttribute("list", list);
		
		return "mypage/mypage_couponAndPoint";
	}
	
	@RequestMapping("/mypage/accountEdit.do")
	public String accountEdit() {
		return "mypage/mypage_accountEdit";
	}
	
	@RequestMapping("/mypage/memberUpdate.do")
	@ResponseBody
	public Map<String, String> memberUpdate(@RequestParam Map<String, String> map){
		int result = service.memberUpdate(map);
		
		return new HashMap<String, String>();
	}
	
	@RequestMapping("/mypage/cardManagement.do")
	public String cardManagement() {
		return "mypage/mypage_cardManagement";
	}
	
	@RequestMapping("/mypage/deleteMember.do")
	public String deleteMember() {
		return "mypage/mypage_deleteMember";
	}
	
	

}
