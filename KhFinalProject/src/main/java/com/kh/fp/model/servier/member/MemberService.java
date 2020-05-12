package com.kh.fp.model.servier.member;

import com.kh.fp.model.vo.Member;

public interface MemberService {
	
	int insertMember(Member m);
	
	Member selectMember(String userId);

}
