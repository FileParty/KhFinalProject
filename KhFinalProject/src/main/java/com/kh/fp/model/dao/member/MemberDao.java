package com.kh.fp.model.dao.member;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.fp.model.vo.Business;
import com.kh.fp.model.vo.Delivery;
import com.kh.fp.model.vo.Member;

public interface MemberDao {
	
	int insertMember(SqlSessionTemplate session,Member m);
	
	Member selectMember(SqlSessionTemplate session,String userId);
	
	int insertBusiness(SqlSessionTemplate session,Business b);
	
	Business selectBusiness(SqlSessionTemplate session,String userId);
	
	Member selectMemberName(SqlSessionTemplate session, String name);
	
	int updateMemberPw(SqlSessionTemplate session,Member m);
	
	int updateBusinessPw(SqlSessionTemplate session,Business b);
	
	Member selectMemberId(SqlSessionTemplate session, String m_email);
	
	Business selectBusinessId(SqlSessionTemplate session, String b_email);
	
	Member selectKakao(SqlSessionTemplate session, String kname);
	
	Member selectNaverM(SqlSessionTemplate session,String email);
	
	int insertDelivery(SqlSessionTemplate session,Member mb);
	
	Member selectDelivery(SqlSessionTemplate session,Member m);
	
	Delivery selectDeliveryI(SqlSessionTemplate session,Member m);
	


}
