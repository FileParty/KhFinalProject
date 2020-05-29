package com.kh.fp.controller.orderinfo;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.fp.model.service.orderinfo.OrderInfoService;

@Controller
public class OrderInfoController {

	@Autowired
	private OrderInfoService service;
	
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
}
