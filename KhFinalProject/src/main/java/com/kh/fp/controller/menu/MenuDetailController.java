
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
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.fp.model.servier.menuDetail.MenuDatailService;
import com.kh.fp.model.vo.Report;
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
			if(store.size()!=0) {
				for(int i=0;i<store.size();i++) {
					Map map = store.get(i);
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
			storeSession.put("storeNo", no);
			storeSession.put("storeImg", sdi.getS_logimg());
			store.add(storeSession);
		}
		session.setAttribute("recentList", store);
		mv.setViewName("/menu/menuDetail");
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
		return sm;
	}
	
	@RequestMapping("/menu/menuOrderEnd")
	@ResponseBody
	public void menuOrderEnd(ModelAndView mv, String newOrders,HttpSession session) {
		try {
			List<Map> m = mapper.readValue(newOrders, List.class);
			session.removeAttribute("orderList");
			String ops = "";
			for(int i=0;i<m.size()-1;i++) {
				Map ms = m.get(i);
				if(ms.get("reqOp")!=null) {
					Map reqOp = (Map)ms.get("reqOp");
					ops += reqOp.get("reqOpName");
				}
				if(ms.get("unReqOp")!=null) {
					List<Map> unReqOp = (List<Map>)ms.get("unReqOp");
					for(int j=0;j<unReqOp.size();j++) {
						ops += ","+((Map)unReqOp.get(j)).get("unReqOpName");
					}
				}
				ms.put("opNames", ops);
			}
			session.setAttribute("orderList", m);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/menu/storeReview")
	@ResponseBody
	public List storeReview(@RequestParam int no, @RequestParam(defaultValue = "1") int cPage,
			@RequestParam(required = false) String type, @RequestParam(defaultValue = "0") int r_no){
		Map que = new HashMap();
		que.put("no", no);
		que.put("type",type);
		if(r_no!=0) {
			que.put("r_no", r_no);
		}
		List list = service.selectStoreDetailReview(que,cPage);
		return list;
	}
	
	
	@RequestMapping("/menu/reviewReport")
	@ResponseBody
	public int storeReviewReport(@RequestParam String reportVar) throws JsonMappingException, JsonProcessingException {
		Report report = mapper.readValue(reportVar, Report.class);
		int result = service.insertReport(report);
		log.debug("신고"+report);
		return result;
	}
	

}