package com.kh.fp.model.dao.member;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.fp.model.vo.Coupon_SH;
import com.kh.fp.model.vo.Member_SH;
import com.kh.fp.model.vo.OrderInfo;

public interface MemberDao_SH {

	List<Coupon_SH> selectCoupon(SqlSessionTemplate session);

	int selectCouponCount(SqlSessionTemplate session,int m_no);

	int insertOrderInfo(SqlSessionTemplate session, OrderInfo o);

//	Object selectMemberPay(SqlSessionTemplate session, int m_no);



}
