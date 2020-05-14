package com.kh.fp.model.servier.member;

import com.kh.fp.model.vo.Business;
import com.kh.fp.model.vo.Member;

public interface MemberService {
	
	int insertMember(Member m);
	
	Member selectMember(String userId);
	
	int insertBusiness(Business b);
	
	Business selectBusiness(String userId);
	
	Member selectMemberName(String name);
	
	Business selectBusinessId(String userId);
	

}
