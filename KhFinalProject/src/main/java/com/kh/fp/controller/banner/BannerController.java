package com.kh.fp.controller.banner;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fp.model.vo.Business;
import com.kh.fp.model.vo.Member;

@Controller
public class BannerController {
	
	@RequestMapping("/banner/couponBanner")
	public ModelAndView couponBanner(ModelAndView mv,HttpSession session) {
		if(session.getAttribute("loginMember")!=null){
			Member m = null;
			Business b = null;
			Map loginType = new HashMap();
			try{
				m = (Member)session.getAttribute("loginMember");
				loginType.put("type", "m");
				loginType.put("no", m.getM_No());
			} catch(Exception e){
				b = (Business)session.getAttribute("loginMember");
				loginType.put("type", "b");
				loginType.put("no", b.getB_No());
			}
			mv.addObject("loginType", loginType);
		}
		mv.setViewName("/banner/couponBanner");
		return mv;
	}

}
