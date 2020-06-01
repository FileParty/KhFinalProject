package com.kh.fp.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fp.model.service.admin.AdminService;
import com.kh.fp.model.vo.AdminApplyStore;
import com.kh.fp.model.vo.AdminApplyStoreInfo;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class AdminControllerCB {

	@Autowired
	private AdminService service;

	@RequestMapping("/admin/report.do")
	public ModelAndView report(ModelAndView mv, HttpServletRequest req) {

		List<Map<String, String>> list = service.selectReport();
		mv.addObject("list", list);
		mv.setViewName("/admin/report");

		if (req.getParameter("msg") == null) {
			mv.addObject("msg", "없음");
		} else if (req.getParameter("msg").equals("리뷰비활성화성공"))
			mv.addObject("msg", "리뷰비활성화성공");
		else if (req.getParameter("msg").equals("리뷰비활성화해제"))
			mv.addObject("msg", "리뷰비활성화해제");
		else if (req.getParameter("msg").equals("신고해제성공"))
			mv.addObject("msg", "신고해제성공");
		else if (req.getParameter("msg").equals("신고해제실패"))
			mv.addObject("msg", "신고해제실패");

		return mv;
	}

	@RequestMapping("/admin/updateReport.do")
	public ModelAndView updateReport(ModelAndView mv, HttpServletRequest req) {

		if (req.getParameter("action").equals("리뷰비활성화")) {
			int flag = 0;

			for (int i = 0; i < req.getParameterValues("re_no").length; i++) {

				int result = service.updateReportY(Integer.parseInt(req.getParameterValues("re_no")[i]));

				if (result <= 0) {
					flag++;
				}

				
				  result = service.updateReviewStatus(Integer.parseInt(req.getParameterValues("r_no")[i]));
				 

				if (result <= 0) {
					flag++;
				}

			}

			if (flag <= 0)
				mv.addObject("msg", "리뷰비활성화성공");
			else
				mv.addObject("msg", "리뷰비활성화실패");

		} else {
			int flag = 0;

			for (int i = 0; i < req.getParameterValues("re_no").length; i++) {

				int result = service.updateReportM(Integer.parseInt(req.getParameterValues("re_no")[i]));

				if (result <= 0) {
					flag++;
				}

			}

			if (flag <= 0)
				mv.addObject("msg", "신고해제성공");
			else
				mv.addObject("msg", "신고해제실패");
		}

		mv.setViewName("redirect:/admin/report.do");

		return mv;
	}

}
