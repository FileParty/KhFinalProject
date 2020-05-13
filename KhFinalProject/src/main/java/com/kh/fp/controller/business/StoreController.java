package com.kh.fp.controller.business;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fp.model.vo.StoreEnroll;

@Controller
public class StoreController {

	@Autowired
	Logger logger;
	
	@RequestMapping("/store/storeEnroll.do")
	public ModelAndView insertStore(ModelAndView mv,MultipartFile slogimg,MultipartFile[] input_imgs,HttpSession session,
			StoreEnroll s) {
	
		String path = session.getServletContext().getRealPath("/resources/upload/store/");
		logger.debug(""+s);
		mv.setViewName("redirect:");
		return mv;
	}
	
	
}
