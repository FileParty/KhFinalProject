
package com.kh.fp.controller.menu;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.fp.model.servier.menuDetail.MenuDatailService;
import com.kh.fp.model.vo.MenuDetailOrder;
import com.kh.fp.model.vo.StoreDetailInfo;
import com.kh.fp.model.vo.StoreMenu;

import lombok.extern.slf4j.Slf4j;



@Controller
@Slf4j
public class MenuDetailController {
	@Autowired
	ObjectMapper mapper;
	@Autowired
	private MenuDatailService service;
	
	@RequestMapping("/menu/menuDetailView")
	public ModelAndView menuDetail(ModelAndView mv, HttpSession session, @RequestParam(defaultValue="1") int no,
			@RequestParam(required = false)String category, @RequestParam(required = false)String sortType, 
			@RequestParam(required = false)String search, @RequestParam(defaultValue="1") int cPage) {
		StoreDetailInfo sdi = service.selectStroeDetailInfo(no);
		Map rMap = new HashMap();
		rMap.put("no", no);
		rMap.put("menuCategory", category);
		rMap.put("sortType", sortType);
		rMap.put("search", search);
		rMap.put("cPage", cPage);
		mv.addObject("store",sdi);
		mv.addObject("rMap",rMap);
		List<Map> store = null;
		Map storeSession = new HashMap();
		try {
			store = (List)session.getAttribute("recentList");
			log.debug("try"+store);
			if(store.size()!=0) {
				for(int i=0;i<store.size();i++) {
					Map map = store.get(i);
					log.debug("리스트사이즈:"+store.size()+"i:"+i+"storeNo:"+map.get("storeNo")+",no:"+no);
					if(!(map.get("storeNo").equals(no))&&(i+1)==store.size()) {
						storeSession.put("storeNo", no);
						storeSession.put("storeImg", sdi.getS_logimg());
						store.add(storeSession);
						break;
					} else {
						if(map.get("storeNo").equals(no)) {
							break;
						}
					}
				}
			} else {
				storeSession.put("storeNo", no);
				storeSession.put("storeImg", sdi.getS_logimg());
				store.add(storeSession);
			}
		} catch(Exception e) {
			store = new ArrayList();
			log.debug("catch"+store);
			storeSession.put("storeNo", no);
			storeSession.put("storeImg", sdi.getS_logimg());
			store.add(storeSession);
		}
		session.setAttribute("recentList", store);
		mv.setViewName("/menu/menuDetail");
		log.debug("세션에 넣음 : "+session.getAttribute("recentList"));
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
	
	@RequestMapping("/menu/menuOrderEnd")
	@ResponseBody
	public void menuOrderEnd(ModelAndView mv, String newOrders,HttpSession session) {
		try {
			List<Map> m = mapper.readValue(newOrders, List.class);
			log.debug(""+m);
			session.removeAttribute("orderList");
			log.debug(""+session.getAttribute("orderList"));
			session.setAttribute("orderList", m);
			List<Map> sM = (List<Map>)session.getAttribute("orderList");
			for(Map ms : sM) {
				log.debug("세션에 넣은거 : "+ms);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	

}