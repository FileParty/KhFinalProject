package com.kh.fp.controller.orderinfo;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.fp.model.service.delivery.DeliveryService;
import com.kh.fp.model.service.menuList.MenuListService;
import com.kh.fp.model.service.orderinfo.OrderInfoService;

@Controller
public class OrderInfoController {

	@Autowired
	private OrderInfoService service;
	@Autowired
	private MenuListService mnService;
	@Autowired
	private DeliveryService dService;
	
	@RequestMapping("/orderInfo/updateState.do")
	@ResponseBody
	public Map updateOrderState(@RequestParam(defaultValue="1") int orderNo) {
		int result = service.updateOrderState(orderNo);
				
		Map map = new HashMap();
		map.put("result", result);
		
		return map;
	}
	
	@RequestMapping("/orderInfo/updateStateComplete.do")
	@ResponseBody
	public Map updateOrderStateComplete(@RequestParam(defaultValue="1") int orderNo) {
		int result = service.updateOrderStateComplete(orderNo);
		
		Map map = new HashMap();
		map.put("result", result);;
		
		return map;
	}
	
	@RequestMapping("/orderInfo/selectOrderInfoStore.do")
	@ResponseBody
	public Map selectOrderInfoStore(int orderNo, int storeNo) {
		String address = service.selectOrderInfoAddress(orderNo);
		Map store = mnService.selectStorexy(storeNo);
		Map delivery = dService.selectDeliveryxy(orderNo);
		
		Map map = new HashMap();
		
		
		map.put("clientAddress", address);
		map.put("storeX", store.get("S_X"));
		map.put("storeY", store.get("S_Y"));
		map.put("storeName", store.get("S_NAME"));
		
		map.put("deliveryX", delivery.get("D_X"));
		map.put("deliveryY", delivery.get("D_Y"));
		map.put("deliveryState", delivery.get("D_STATUS"));
		
		return map;
	}
}
