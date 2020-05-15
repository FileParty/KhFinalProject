
package com.kh.fp.controller.menu;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fp.model.servier.menuDetail.MenuDatailService;
import com.kh.fp.model.vo.StoreDetailInfo;
import com.kh.fp.model.vo.StoreMenu;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@SessionAttributes({ "newOrder" })
public class MenuDetailController {
	
	@Autowired
	private MenuDatailService service;
	
	@RequestMapping("/menu/menuDetailView")
	public ModelAndView menuDetail(ModelAndView mv, HttpSession session, @RequestParam(defaultValue="1") int no) {
		StoreDetailInfo sdi = service.selectStroeDetailInfo(no);
		mv.addObject("store",sdi);
		List<Map> store = null;
		Map storeSession = new HashMap();
		try {
			store = (List)session.getAttribute("store");
			for(Map map : store) {
				if(!map.get("storeNo").equals(no)) {
					storeSession.put("storeNo", no);
					storeSession.put("storeImg", sdi.getS_logimg());
				} else {
					map.put("storeImg",sdi.getS_logimg());
				}
			}
			store.add(storeSession);
		} catch(NullPointerException e) {
			store = new ArrayList();
			storeSession.put("storeNo", no);
			storeSession.put("storeImg", sdi.getS_logimg());
			store.add(storeSession);
		}
		session.setAttribute("store", store);
		mv.setViewName("/menu/menuDetail");
		log.debug("세션에 넣음 : "+session.getAttribute("store"));
		return mv;
	}
	
	@RequestMapping("/menu/menuDetailCategoryMenus")
	@ResponseBody
	public List<StoreMenu> menuDetailCategoryMenus(int no) {
		return service.selectCategoryMenu(no);
	}
	
	@RequestMapping("/menu/storeMenuSelectModalAjax")
	@ResponseBody
	public StoreMenu storeMenuSelectModalAjax(int no) {
		StoreMenu sm = service.selectMenuDetail(no);
		log.debug(""+sm);
		return sm;
	}
	
	@RequestMapping(value="menu/menuOrderEnd",method = RequestMethod.POST)
	@ResponseBody
	public void menuOrderEnd(ModelAndView mv,@RequestParam Map order) {
		log.debug(""+order);
		List<Map> orderList = new ArrayList<Map>();
		orderList.add(order);
		mv.addObject("newOrder",orderList);
	}

}