package com.kh.fp.model.servier.member;

import com.kh.fp.model.vo.Business;
import com.kh.fp.model.vo.Delivery;
import com.kh.fp.model.vo.Member;

public interface MemberService {
	
	int insertMember(Member m);
	
	Member selectMember(String userId);
	
	int insertBusiness(Business b);
	
	Business selectBusiness(String userId);
	
	Member selectMemberName(String name);
	
	int updateMemberPw(Member m);
	
	int updateBusinessPw(Business b);
	
	Member selectMemberId(String m_email);
	
	Business selectBusinessId(String b_email);
	
	Member selectKakao(String kname);
	
	Member selectNaverM(String email);
	
	int insertDelivery(Member mb);
	
	Member selectDelivery(Member m);
	
	Delivery selectDeliveryI(Member m);
	

	
	
	
	

	
	
	
	
	
	



	

}
