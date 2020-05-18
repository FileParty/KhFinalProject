package com.kh.fp.controller.menu;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.fp.common.PageingFactory;
import com.kh.fp.model.service.menuList.MenuListService;
import com.kh.fp.model.vo.Store;

@Controller
public class MenuListController {
	
//	private String title;
//	private double score;
//	private int reviewCount;
//	private int deleveryMinCharge;
//	private int deleveryTime;
//	private String listCategory;
//	private double km;
//	private String logimg;
//	private String recentimg;
	
	@Autowired
	private MenuListService service;
	
	@RequestMapping("/menu/menuList.do")
	public String menuList(Model m, 
			@RequestParam(value="menuCategory", required=false, defaultValue="전체") String category,
			@RequestParam(required=false, defaultValue="null") String sortType,
			@RequestParam(required=false, defaultValue="null") String search,
			@RequestParam(required=false, defaultValue="1") int cPage,
			@RequestParam(required=false, defaultValue="10") int numperPage,
			@RequestParam(required=false, defaultValue="0") double xl,
			@RequestParam(required=false, defaultValue="0") double yl,
			@RequestParam(required=false, defaultValue="") String addr,
			HttpSession session,
			HttpServletResponse res
			) {		
						
		//위도 경도 세션 처리
		if(xl==0 && yl==0) {
			xl = (double)session.getAttribute("xl");
			yl = (double)session.getAttribute("yl");
		}else {
			session.setAttribute("xl", xl);
			session.setAttribute("yl", yl);
		}

		Map map = new HashMap();
		
		//최근 본 상품 세션 처리
		if(session.getAttribute("recentList")!=null) {
			map.put("recentList", session.getAttribute("recentList"));
			
			List<Map> recentList = (List<Map>)map.get("recentList");
			
			System.out.println("===최근====");
			for(Map rm : recentList) {
				System.out.println(rm.get("storeNo"));
				System.out.println(rm.get("storeImg"));
			}
		}

		
		
		if(!addr.equals(""))
			session.setAttribute("addr", addr);
		
		map.put("category", category);
		map.put("sortType", sortType);
		map.put("search", search);
		map.put("xl", xl);
		map.put("yl", yl);
		map.put("cPage", cPage);
		
		List<Store> storeList = service.selectMenuList(cPage, numperPage, map);
			
		int totalData = service.selectMenuCount(map);
		
		m.addAttribute("list", storeList);
		m.addAttribute("category", category);
		m.addAttribute("sortType", sortType);
		m.addAttribute("search", search);
		m.addAttribute("cPage", cPage);
		
		m.addAttribute("pageBar", PageingFactory.PageBarFactory(cPage, numperPage, totalData, "/spring/menu/menuList.do", category, search, sortType));
			
		
		return "menu/menulist";
	}
	
	//카테고리, 정렬, 검색 했을 때
	@RequestMapping("/menu/menuFilter.do")
	@ResponseBody
	public Map menuCategory(
			@RequestParam(value="menuCategory", required=false, defaultValue="전체") String category,
			@RequestParam(required=false, defaultValue="null") String sortType,
			@RequestParam(required=false, defaultValue="null") String search,
			@RequestParam(required=false, defaultValue="1") int cPage,
			@RequestParam(required=false, defaultValue="10") int numperPage,
			@RequestParam(required=false, defaultValue="0") double xl,
			@RequestParam(required=false, defaultValue="0") double yl,
			@RequestParam(required=false, defaultValue="") String addr,
			HttpSession session
			) {
		
		
		
		if(xl==0 && yl==0) {
			xl = (double)session.getAttribute("xl");
			yl = (double)session.getAttribute("yl");
		}else {
			session.setAttribute("xl", yl);
			session.setAttribute("yl", yl);
		}
		
		Map map = new HashMap();
		
		//최근 본 상품 세션 처리
		List<Map> store = null;
		if(session.getAttribute("recentList")!=null) {
			store =(List)session.getAttribute("recentList");
			
			System.out.println("===최근====");
			for(Map rm : store) {
				System.out.println(rm.get("storeNo"));
				System.out.println(rm.get("storeImg"));
			}
		}

		if(!addr.equals(""))
			session.setAttribute("addr", addr);
		
		map.put("category", category);
		map.put("sortType", sortType);
		map.put("search", search);
		map.put("xl", xl);
		map.put("yl", yl);	
		
		int totalData = service.selectMenuCount(map);
		
		List<Store> storeList = service.selectMenuListFilter(cPage, numperPage, map);
		
		map.put("cPage", cPage);
		map.put("list", storeList);
		
		map.put("pageBar", PageingFactory.PageBarFactoryAjax(cPage, numperPage, totalData, "/spring/menu/menuFilter.do", category, search, sortType));
		
		return map;
	}
}
