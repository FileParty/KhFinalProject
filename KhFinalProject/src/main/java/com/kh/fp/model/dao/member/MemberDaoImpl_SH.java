package com.kh.fp.model.dao.member;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.fp.model.vo.Coupon_SH;
import com.kh.fp.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class MemberDaoImpl_SH implements MemberDao_SH {
	
	
	@Override
	public List<Coupon_SH> selectCoupon(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("member.selectCoupon");
	}
//	@Override
//	public Object selectMemberPay(SqlSessionTemplate session, int m_no) {
//		// TODO Auto-generated method stub
//		return session.selectOne("member.selectMemberPay",m_no);
//	}

	@Override
	public int selectCouponCount(SqlSessionTemplate session,int m_no) {
		// TODO Auto-generated method stub
		return session.selectOne("member.selectCouponCount",m_no);
	}

	@Override
	public int insertOrderInfo(SqlSessionTemplate session, Map<String, String> map) {
		// TODO Auto-generated method stub
		return session.insert("infoOrder.insertOrderInfo",map);
	}



	@Override
	public int updateMemberPoint(SqlSessionTemplate session, Map<String, String> map) {
		// TODO Auto-generated method stub
		return session.update("infoOrder.updateMemberPoint",map);
	}

	@Override
	public Member selectMember(SqlSessionTemplate session, int m_no) {
		// TODO Auto-generated method stub
		return session.selectOne("infoOrder.selectMember",m_no);
	}

	@Override
	public int couponDelete(SqlSessionTemplate session, int couponNo) {
		// TODO Auto-generated method stub
		return session.delete("infoOrder.deleteCoupon",couponNo);
	}

	@Override
	public int insertOrderMenu(SqlSessionTemplate session, Map map) {
		// TODO Auto-generated method stub
		return session.insert("infoOrder.insertOrderMenu",map);
	  
	}






}
