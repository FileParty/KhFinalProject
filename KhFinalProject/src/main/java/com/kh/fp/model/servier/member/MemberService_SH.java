package com.kh.fp.model.servier.member;

import java.util.List;

import com.kh.fp.model.vo.Coupon_SH;
import com.kh.fp.model.vo.Member_SH;
import com.kh.fp.model.vo.OrderInfo;

public interface MemberService_SH {

	List<Coupon_SH> selectCoupon();

	int selectCouponCount(int m_no);

	int insertOrderInfo(OrderInfo o);

//	Object selectMemberPay(int m_no);

	

}
