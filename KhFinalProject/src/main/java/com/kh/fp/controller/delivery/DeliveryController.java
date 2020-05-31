package com.kh.fp.controller.delivery;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.fp.model.service.delivery.DeliveryService;
import com.kh.fp.model.vo.Delivery;

@Controller
public class DeliveryController {

	@Autowired
	private DeliveryService service;
	
	@RequestMapping("/delivery/updateDelivery.do")
	@ResponseBody
	public Map updateDelivery(Delivery d) {
		
		System.out.println("deliveryController");
		System.out.println(d);
		
		int result = service.updateDelivery(d);
		
		
		
		Map map = new HashMap();
		map.put("result", result);
		
		return map;
	}
	
	@RequestMapping("/delivery/updateDeliveryComplete.do")
	@ResponseBody
	public Map updateDeliveryComplete(Delivery d) {
		int result = service.updateDeliveryComplete(d);
		
		Map map = new HashMap();
		map.put("result", result);
		
		return map;
	}
}
