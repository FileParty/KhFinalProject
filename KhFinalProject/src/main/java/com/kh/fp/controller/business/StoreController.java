package com.kh.fp.controller.business;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
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

import com.kh.fp.controller.business.service.StoreServiceImpl;
import com.kh.fp.model.vo.StoreEnroll;

@Controller
public class StoreController {

	@Autowired
	Logger logger;
	
	@Autowired
	StoreServiceImpl service;
	
	@RequestMapping("/store/storeEnroll.do")
	public ModelAndView insertStore(ModelAndView mv,MultipartFile slogimg,MultipartFile[] input_imgs,HttpSession session,
			StoreEnroll s) {
	
		String path = session.getServletContext().getRealPath("/resources/upload/store/");
		List<String> files = new ArrayList<String>();
		int result=0;
		File f= new File(path);
		
		if(!f.exists()) {
			f.mkdirs();
		}
		
		if(!slogimg.isEmpty()) {
			
			try {
				String orilog = slogimg.getOriginalFilename();
				s.setLogimg(orilog);
				slogimg.transferTo(new File(path+orilog));
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			for(MultipartFile mf : input_imgs) {
				
				if(!mf.isEmpty()) {
					String ori= mf.getOriginalFilename();
					try {
					mf.transferTo(new File(path+ori));
					}catch(IOException e) {
						e.printStackTrace();
					}
					files.add(ori);
				}
				
			}
				
		}
		
		try {
			result =service.insertStore(s,files);
		}catch (RuntimeException e) {
			File delFlog = new File(path+s.getLogimg());
			if(delFlog.exists()) {
				delFlog.delete();
			}
			for(String sf: files) {
				File delF = new File(path+sf);
				if(delF.exists()) {
					delF.delete();
				}
			}
		}
		
		mv.setViewName("redirect:");
		return mv;
	}
	
	
}
