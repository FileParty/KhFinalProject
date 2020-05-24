package com.kh.fp.model.servier.member;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fp.model.dao.member.MemberDao_SH;
import com.kh.fp.model.vo.Coupon_SH;
import com.kh.fp.model.vo.Member_SH;


@Service
public class MemberServiceImpl_SH implements MemberService_SH {
	@Autowired
	private MemberDao_SH dao;
	
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public List<Coupon_SH> selectCoupon() {
		// TODO Auto-generated method stub
		return dao.selectCoupon(session);
	}

	@Override
	public int selectCouponCount(int m_no) {
		// TODO Auto-generated method stub
		return dao.selectCouponCount(session,m_no);
	}

	@Override
	public int insertOrderInfo(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.insertOrderInfo(session,map);
	}



//	@Override
//	public Object selectMemberPay(int m_no) {
//		// TODO Auto-generated method stub
//		return dao.selectMemberPay(session,m_no);
//	}



}
