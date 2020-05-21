package com.kh.fp.controller.business;

import static com.kh.fp.common.PageingFactory.PageBarFactory;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fp.controller.business.service.LicenseeService;
import com.kh.fp.model.vo.Business;
import com.kh.fp.model.vo.Menu;
import com.kh.fp.model.vo.MenuCategory;
import com.kh.fp.model.vo.MenuSide;
import com.kh.fp.model.vo.Side;
import com.kh.fp.model.vo.SideAll;
import com.kh.fp.model.vo.Store;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class LicenseeController {
	
	
	@Autowired
	LicenseeService service;
	
	@Autowired
	Logger logger;
	
	
	@RequestMapping("/licensee/storeEnroll")
	public String storeEnroll() {
		//매장등록
		return "business/storeEnroll";
	}
	

	@RequestMapping("/licensee/menuStatus")
	public ModelAndView menuStatus(ModelAndView mv,HttpSession session) {
		//메뉴관리
		//셀렉용
		Business b = (Business)session.getAttribute("loginMember");
		 if(b==null) {
				mv.addObject("msg", "로그인하셈");
				mv.addObject("loc", "/");
				mv.setViewName("common/msg");
				return mv;
		 }
		List<Store> list = service.selectStore(b.getB_no());
		mv.addObject("store",list);
		mv.setViewName("business/menuStatus");
		return mv;
	}
	
	@RequestMapping("/licensee/menuSelect")
	@ResponseBody
	public List<Menu> menuSelect(ModelAndView mv,HttpSession session,int s_no) {
		//메뉴상세
		Business b = (Business)session.getAttribute("loginMember");
		List<Menu> menu = service.selectMenuList(s_no);
			return menu;
	}
	@RequestMapping("/licensee/menuEnroll")
	public ModelAndView menuEnroll(HttpSession session,ModelAndView mv ) {
		//메뉴등록
		 Business b = (Business)session.getAttribute("loginMember");
		 if(b==null) {
				mv.addObject("msg", "로그인하셈");
				mv.addObject("loc", "/");
				mv.setViewName("common/msg");
				return mv;
		 }
		 List<Store> store = service.selectStore(b.getB_no());
		 
		 mv.addObject("store",store);
		 mv.setViewName("business/menuEnroll");
		return mv;
	}
	
	@RequestMapping("/licensee/calculate")
	public String calculate() {
		//정산내역
		return "business/calculate";
	}
	
	@RequestMapping("/licensee/order")
	public ModelAndView order(ModelAndView mv,@RequestParam(required = false,defaultValue = "1")int cPage,
			@RequestParam(required = false ,defaultValue = "2")int numPerpage) {
		//주문내역
		int no=1;
		List<Map<String, Object>> list = service.getOrderInfo(no,cPage,numPerpage);
		int totalData=service.getOrderInfoAll(no);
		
		
		
		mv.addObject("total",totalData);
		mv.addObject("list", list);
		mv.addObject("pageBar", PageBarFactory( cPage, numPerpage, totalData,"/spring/licensee/order"));
		mv.setViewName("business/order");
		return mv;
	}
	
	@RequestMapping("/licensee/orderEnd")
	public String orderEnd() {
		//주문완료내역
		return "business/orderEnd";
	}
	@RequestMapping("/licensee/review")
	public String review() {
		//리뷰관리
		return "business/review";
	}
	
	@RequestMapping("/licensee/getdetailorder")
	public List<Map<String, Object>> getDetailOrder(int no){
		List<Map<String, Object>> data = service.getDetailOrder(no);
		return data;
	}
	@RequestMapping("/licensee/menuEnrollEnd")
	
	public String menuEnroll(HttpSession session,HttpServletRequest req,MultipartFile[] me_logImg,Model model) {
		
				
		String path = session.getServletContext().getRealPath("/resources/upload/business/");
		//메뉴등록
		String[] mtNo = req.getParameterValues("mt_no");
		//카테고리 코드
		String[] cateEnd = req.getParameterValues("categoryEnd");
		String[] menuName = req.getParameterValues("me_name");
		String[] mPrice = req.getParameterValues("me_price");		
		String[] detail = req.getParameterValues("me_text");
		String[] sdNoEnd = req.getParameterValues("sdNoEnd");
		String[] counts = req.getParameterValues("count");
		int storeNo = Integer.parseInt(req.getParameter("storeNum"));

		int menuPrice[] = new int[mPrice.length];

		int mtNoEnd[] = new int[mtNo.length];
		int sdNo[] = new int[sdNoEnd.length];
		int count[] = new int[counts.length];
		
		
		
		for(int i=0;i<sdNoEnd.length;i++) {
			sdNo[i] = Integer.parseInt(sdNoEnd[i]);
		}
		for(int i=0;i<mtNoEnd.length;i++) {
			mtNoEnd[i] = Integer.parseInt(mtNo[i]);
		}
		for(int i=0;i<mPrice.length;i++) {
			menuPrice[i]= Integer.parseInt(mPrice[i]);
			//메뉴가격
		}
		for(int i=0;i<counts.length;i++) {
			count[i] = Integer.parseInt(counts[i]);
			// 0 3
			// 1 2 
		}
		
	
		
		List<Menu> list = new ArrayList();
		File f = new File(path);
		if(!f.exists()) {
			f.mkdirs();
		}
		Menu m = null;
		
		for(int i=0;i<menuName.length;i++) {
			m = new Menu();
			m.setMe_name(menuName[i]);
			m.setMe_price(menuPrice[i]);
			
			MultipartFile mf = me_logImg[i];
				if(!mf.isEmpty()) {
					String ori = mf.getOriginalFilename();
					String ext = ori.substring(ori.lastIndexOf("."));
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
					int rnd = (int)(Math.random()*1000);
					String rename = "menu_"+sdf.format(System.currentTimeMillis())+"_"+rnd+ext;
					
					try {
						mf.transferTo(new File(path+rename));
						
					}catch(IOException e) {
						e.printStackTrace();
					}
					m.setMe_logImg(rename);
					
				}
				if(m.getMe_logImg()==null) {
					m.setMe_logImg("null");
				}
			
			m.setMt_no(mtNoEnd[i]);
			m.setMe_text(detail[i]);
			if(cateEnd[i].equals("대표메뉴")) {
			m.setMe_best("Y");
			}else {
				m.setMe_best("N");
			}
			m.setS_no(storeNo);
			list.add(m);
			log.debug(""+list.get(i));
		}
		int result = 0;
		int is = 0;
		int test[] ;
		MenuSide mss = null;
		List<MenuSide> list3 = new ArrayList();
		
			
			for(int i=0;i<count.length;i++) {
				test = new int[count[i]];
				
				if(i==0) {

				for(int j=0;j<count[i];j++) {	
					mss=new MenuSide();
					mss.setSd_no(sdNo[j]);
					list3.add(mss);

				}
				}else {
					list3 = new ArrayList();
					for(int j=count[i-1];j<count[i-1]+count[i];j++) {	
						mss=new MenuSide();
						mss.setSd_no(sdNo[j]);
						list3.add(mss);
						
					}
					
				}				
				result= service.insertMenu(list.get(i),list3);
				
				
			}
			
			String page ="";
			if(result>0) {
				page = "common/msg";
				model.addAttribute("msg","메뉴등록 성공!");
				model.addAttribute("loc","/licensee/menuStatus");
			}else {
				page = "common/msg";
				model.addAttribute("msg","메뉴등록 실패!");
				model.addAttribute("loc","/licensee/menuEnroll");
			}
		
		return page;
	}
	
	@RequestMapping("/licensee/optionEnroll")
	
	public String optionEnroll(HttpServletRequest req,Model m) {
		//추가옵션등록
		String[] ess = req.getParameterValues("sd_name");
		String[] price = req.getParameterValues("sd_price");
		String[] division = req.getParameterValues("sd_division");
		int storeNo = Integer.parseInt(req.getParameter("storeNum"));
		int result = 0;
		int[] prc = new int[price.length];
		for(int i=0;i<price.length;i++) {
			prc[i] = Integer.parseInt(price[i]);
		}

		for(int i=0;i<ess.length;i++) {
			Map<String, Object> map = new HashMap();
			map.put("sd_name",ess[i]);
			map.put("sd_price",prc[i]);
			map.put("sd_division",division[i]);
			map.put("s_no",storeNo);
			result = service.insertSide(map);
		}
		String page ="";
		if(result>0) {
			page = "common/msg";
			m.addAttribute("msg","옵션등록 성공!");
			m.addAttribute("loc","/licensee/menuEnroll");
		}else {
			page = "common/msg";
			m.addAttribute("msg","옵션등록 실패!");
			m.addAttribute("loc","/licensee/menuEnroll");
		}
		return page;

	}
	@RequestMapping("/licensee/categoryEnroll")
	public String categoryEnroll(HttpServletRequest req,Model m) {
		//카테고리등록
		String[] category = req.getParameterValues("category");
		int storeNo = Integer.parseInt(req.getParameter("storeNo"));
		int result = 0;
		for(int i=0;i<category.length;i++) {
			
		Map<String,Object> map = new HashMap();
		map.put("mt_name",category[i]);
		map.put("s_no",storeNo);
		 result = service.insertCategory(map);
		}
		
		String page ="";
		if(result>0) {
			page = "common/msg";
			m.addAttribute("msg","옵션등록 성공!");
			m.addAttribute("loc","/licensee/menuEnroll");
		}else {
			page = "common/msg";
			m.addAttribute("msg","옵션등록 실패!");
			m.addAttribute("loc","/licensee/menuEnroll");
		}
		return page;
	}
	@RequestMapping("/licensee/selectCategory")
	@ResponseBody
	public List<MenuCategory> selectCategory(int s_no) {
		//카테고리조회		
		List<MenuCategory> list = service.selectCategory(s_no);
		
		return list;
	}
	
	@RequestMapping("/licensee/selectOption")
	@ResponseBody
	public List<Side> selectOption(int s_no) {
		//추가옵션 조회
		List<Side> list = service.selectOption(s_no);
		return list;
		
	}
	
	@RequestMapping("/licensee/selectMenuSide")
	@ResponseBody
	public List<SideAll> selectMenuSide(int s_no,int me_no) {
		//추가옵션 조회
		Map<String,Object> map = new HashMap();
		map.put("s_no", s_no);
		map.put("me_no",me_no);
		 List<SideAll> list = service.selectMenuSide(map);
		return list;
		
	}
	
	

}
