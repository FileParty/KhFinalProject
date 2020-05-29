package com.kh.fp.controller.business;

import static com.kh.fp.common.PageingFactory.PageBarFactoryBeom;

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
import com.kh.fp.model.vo.Review;
import com.kh.fp.model.vo.ReviewAll;
import com.kh.fp.model.vo.ReviewImg;
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
		 
		List<Store> list = service.selectStore(b.getB_No());
		
		 if(list.size() == 0) {
			 mv.addObject("msg","등록 된 매장이 없습니다!");
			 mv.addObject("loc","/store/mypage");
			 mv.setViewName("common/msg");
			 return mv;
		}else {
		 mv.addObject("store",list);
		 mv.setViewName("business/menuStatus");
		 return mv;
		}
	}
	
	@RequestMapping("/licensee/businessStore")
	public ModelAndView businessStore(ModelAndView mv,HttpSession session) {
		
		//셀렉용
		Business b = (Business)session.getAttribute("loginMember");
		 if(b==null) {
				mv.addObject("msg", "로그인하셈");
				mv.addObject("loc", "/");
				mv.setViewName("common/msg");
				return mv;
		 }
		 
		List<Store> list = service.selectStore(b.getB_No());
		mv.addObject("store",list);
		mv.setViewName("business/menuEnroll");
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
	
	@RequestMapping("/licensee/menuCount")
	@ResponseBody
	public Map menuCount(ModelAndView mv,HttpSession session,int s_no) {
		//메뉴카운트
		
		Map menuCount = service.menuCount(s_no);
			return menuCount;
	}
	
	@RequestMapping("/licensee/menuEnroll")
	public ModelAndView menuEnroll(HttpSession session,ModelAndView mv ) {
		
		 Business b = (Business)session.getAttribute("loginMember");
		 if(b==null) {
				mv.addObject("msg", "로그인하셈");
				mv.addObject("loc", "/");
				mv.setViewName("/common/msg");
				return mv;
		 }
		 List<Store> store = service.selectStore(b.getB_No());
		 
		 if(store.size() == 0) {
			 mv.addObject("msg","등록 된 매장이 없습니다!");
			 mv.addObject("loc","/store/mypage");
			 mv.setViewName("common/msg");
			 return mv;
		}else {
		 mv.addObject("store",store);
		 mv.setViewName("business/menuEnroll");
		 return mv;
		}
		
	}
	
	
	@RequestMapping("/licensee/order")
	public ModelAndView order(ModelAndView mv,@RequestParam(required = false,defaultValue = "1")int cPage,
			@RequestParam(required = false ,defaultValue = "7")int numPerpage,@RequestParam(required = false,defaultValue = "0")int no,HttpSession session) {
		//주문내역
		Business b = (Business)session.getAttribute("loginMember");
		List<Store> stores = new ArrayList<Store>();
		if(b==null) {
			mv.addObject("msg", "로그인해주세요");
			mv.addObject("loc", "/");
			mv.setViewName("common/msg");
			return mv;
		}
		stores= service.storesNo(b.getB_No());
		if(no==0) {
			
				if(!stores.isEmpty()) {
						no=stores.get(0).getS_No();			
				}else {
					mv.addObject("msg", "가게를 등록해주세요");
					mv.addObject("loc", "/store/mypage");
					mv.setViewName("common/msg");
					return mv;
				}
		}
		List<Map<String, Object>> list = service.getOrderInfo(no,cPage,numPerpage);
		int totalData=service.getOrderInfoAll(no);

		mv.addObject("sno",stores);
		mv.addObject("total",totalData);
		mv.addObject("check",no);
		mv.addObject("list", list);
		mv.addObject("pageBar", PageBarFactoryBeom( cPage, numPerpage, totalData,no,"/spring/licensee/order"));
		mv.setViewName("business/order");
		return mv;
	}
	
	@RequestMapping("/licensee/orderEnd")
	
	public String orderEnd() {
		//주문완료내역
		return "business/orderEnd";
				}
	
	@RequestMapping("/licensee/review")
	public ModelAndView review(ModelAndView mv,HttpSession session) {
		//리뷰
		
		Business b = (Business)session.getAttribute("loginMember");
		 if(b==null) {
				mv.addObject("msg", "로그인하셈");
				mv.addObject("loc", "/");
				mv.setViewName("common/msg");
				return mv;
		 }
		List<Store> list = service.selectStore(b.getB_No());
		mv.addObject("store",list);
		mv.setViewName("business/review");
		return mv;
	}
	
	@RequestMapping("/licensee/reviewSelect")
	@ResponseBody
	public List<ReviewAll>  reviewSelect(ModelAndView mv,HttpSession session,int s_no) {
		//리뷰
		//셀렉용
				
		List<ReviewAll> list = service.selectReview(s_no);
		
		for(int i=0;i<list.size();i++) {
			list.get(i).setR_img(service.selectReviewImg(list.get(i).getR_no()));
			list.get(i).setOrder_menu(service.selectOrderMenu(list.get(i).getO_no()));
			
		}
	
		return list;
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
		String[] sdNoEnds = req.getParameterValues("sdNoEnds");
				
		String[] counts = req.getParameterValues("count");
		String[] counts1 = req.getParameterValues("counts");
		int storeNo = Integer.parseInt(req.getParameter("storeNum"));

		int menuPrice[] = new int[mPrice.length];
		int mtNoEnd[] = new int[mtNo.length];
		int sdNo[] = null;
		int sdNo2[] = null;
		if(sdNoEnd != null) {
			sdNo = new int[sdNoEnd.length];
			for(int i=0;i<sdNoEnd.length;i++) {
				sdNo[i] = Integer.parseInt(sdNoEnd[i]);	
			}
		}
		
		if(sdNoEnds != null) {
			sdNo2 = new int[sdNoEnds.length];
			for(int i=0;i<sdNoEnds.length;i++) {
				sdNo2[i] = Integer.parseInt(sdNoEnds[i]);
			}
		}
		int count[] = new int[counts.length];
		int count1[] = new int[counts1.length];

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
		
		for(int i=0;i<counts1.length;i++) {
			count1[i] = Integer.parseInt(counts1[i]);
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
		int sts = count.length + counts.length;
		MenuSide mss = null;
		List<MenuSide> list3 = new ArrayList();
		
			
			for(int i=0;i<menuName.length;i++) {
				
				
				if(i==0) {

				for(int j=0;j<count[i];j++) {
					if(sdNo == null) {
						break;
					}else {
					mss=new MenuSide();
					mss.setSd_no(sdNo[j]);
					list3.add(mss);
					}
				}
				for(int k=0;k<count1[i];k++) {
					if(sdNo2 == null) {
						break;
					}else {
					mss=new MenuSide();
					mss.setSd_no(sdNo2[k]);
					list3.add(mss);
					}
				}
				
				}else if(i>=1){
					list3 = new ArrayList();
					for(int j=count[i-1];j<count[i-1]+count[i];j++) {	
						if(sdNo2 == null) {
							break;
						}else {
						mss=new MenuSide();
						mss.setSd_no(sdNo[j]);
						list3.add(mss);	
						}
					}
					for(int k=count1[i-1];k<count1[i-1]+count1[i];k++) {
						if(sdNo2 == null) {
							break;
						}else {
						mss=new MenuSide();
						mss.setSd_no(sdNo[k]);
						list3.add(mss);		
						}
					}
					
				}
		
				System.out.println("리스트인데유"+list3);
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
	
	@RequestMapping("/licensee/menuUpdate")
	public String menuUpdate(HttpServletRequest req,Model m) {
		int s_no = Integer.parseInt(req.getParameter("s_no"));
		int me_no = Integer.parseInt(req.getParameter("me_no"));
		int mt_no = Integer.parseInt(req.getParameter("mt_no"));
		String[] sd = req.getParameterValues("sdNo");
		String me_name = req.getParameter("me_name");
		int me_price = Integer.parseInt(req.getParameter("me_price"));
		String me_text = req.getParameter("me_text");
		int sd_no[] = null;
		if(sd!=null) {
		sd_no = new int[sd.length];
		}
		int optionCount = Integer.parseInt(req.getParameter("optionCount"));
		if(optionCount == 0) {
			
		}
		log.debug("가게번호"+s_no);
		log.debug("메뉴번호"+me_no);
		log.debug("카테고리"+mt_no);
		log.debug("메뉴명"+me_name);
		log.debug("메뉴가격"+me_price);
		log.debug("메뉴설명"+me_text);
		Map<String,Object> map = new HashMap();
		map.put("me_name",me_name);
		map.put("me_no",me_no);
		map.put("me_price",me_price);
		map.put("mt_no",mt_no);
		map.put("me_text",me_text);
		map.put("s_no",s_no);
		List<MenuSide> list = new ArrayList<MenuSide>();
		
			
		if(sd_no.length !=0 ) {
		for(int i=0;i<sd_no.length;i++) {
			MenuSide ms = new MenuSide();
			sd_no[i]=Integer.parseInt(sd[i]);
			 ms.setSd_no(sd_no[i]);
			 ms.setMe_no(me_no);
			log.debug("추가번호"+sd_no[i]);
			list.add(ms);
		}
		}
		int result = service.menuUpdate(map,me_no,optionCount);
		if(optionCount == 0 ) {
			if(result>0) {
				result = service.menuSideAdd(list);
			}
		}else {
		if(result>0) {
			result = service.menuSideUpdate(list);
		}
		}
		String page ="";
		if(result>0) {
			page = "common/msg";
			m.addAttribute("msg","수정 성공!");
			m.addAttribute("loc","/licensee/menuStatus");
		}else {
			page = "common/msg";
			m.addAttribute("msg","수정 실패!");
			m.addAttribute("loc","/licensee/menuStatus");
		}
		
		return page;
	}
	
	@RequestMapping("/licensee/reviewReplyEnroll")
	@ResponseBody
	public Review reviewReply(int r_no,String r_reply) {
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("r_no",r_no);
		map.put("r_reply",r_reply);
		Review r = service.updateReviewReply(map); 

		return r;
		
	}
	
	

}
