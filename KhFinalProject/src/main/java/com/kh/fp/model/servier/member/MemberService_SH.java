package com.kh.fp.model.servier.member;

import java.util.List;

import com.kh.fp.model.vo.Coupon_SH;
import com.kh.fp.model.vo.Member_SH;

public interface MemberService_SH {

	List<Coupon_SH> selectCoupon();

	int selectCouponCount(int m_no);

//	Object selectMemberPay(int m_no);

	

}
