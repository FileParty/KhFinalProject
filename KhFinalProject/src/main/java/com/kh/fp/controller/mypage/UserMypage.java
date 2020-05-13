package com.kh.fp.controller.mypage;

import static com.kh.fp.common.PageingFactory.PageBarFactory;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.fp.model.service.mypage.MypageService;

import net.sf.json.JSON;

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
		String userId = (String)session.getAttribute("userId");
		
		int cPage=1;
		
		try {
			cPage = (int)map.get("cPage");
		}catch(Exception e) {
		}
		int numPerPage = 5;
		int totalData = service.getTotalCount(userId);
		String url = "/mypage/mypage.do";
		
		List<Map<String, String>> list = service.selectOrder(userId, cPage, numPerPage);
		
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
		
		return list;
	}
	
	@RequestMapping("/mypage/review.do")
	public String review() {
		return "mypage/mypage_review";
	}
	
	@RequestMapping("/mypage/watchList.do")
	public String watchList() {
		return "mypage/mypage_watchList";
	}
	
	@RequestMapping("/mypage/couponAndPoint.do")
	public String couponAndPoint() {
		return "mypage/mypage_couponAndPoint";
	}
	
	@RequestMapping("/mypage/accountEdit.do")
	public String accountEdit() {
		return "mypage/mypage_accountEdit";
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
