package com.kh.fp.model.servier.member;

import java.util.List;
import java.util.Map;

import com.kh.fp.model.vo.Coupon_SH;
import com.kh.fp.model.vo.Member;
import com.kh.fp.model.vo.Member_SH;


public interface MemberService_SH {

	List<Coupon_SH> selectCoupon();

	int selectCouponCount(int m_no);

	int insertOrderInfo(Map<String, String> map);

	int insertOrderMenu(Map<String, String> map);

	int updateMemberPoint(Map<String, String> map);

	Member selectMember(int m_no);

	int couponDelete(int cn_no);









//	Object selectMemberPay(int m_no);

	

}
