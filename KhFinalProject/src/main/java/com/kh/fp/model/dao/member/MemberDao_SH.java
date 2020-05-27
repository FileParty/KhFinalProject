package com.kh.fp.model.dao.member;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.fp.model.vo.Coupon_SH;
import com.kh.fp.model.vo.Member;
import com.kh.fp.model.vo.Member_SH;


public interface MemberDao_SH {

	List<Coupon_SH> selectCoupon(SqlSessionTemplate session);

	int selectCouponCount(SqlSessionTemplate session,int m_no);

	int insertOrderInfo(SqlSessionTemplate session, Map<String, String> map);

	
	int updateMemberPoint(SqlSessionTemplate session, Map<String, String> map);


	Member selectMember(SqlSessionTemplate session, int m_no);

	int couponDelete(SqlSessionTemplate session, int couponNo);

	int insertOrderMenu(SqlSessionTemplate session, Map map);



//	Object selectMemberPay(SqlSessionTemplate session, int m_no);



}
