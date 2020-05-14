package com.kh.fp.model.dao.member;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.fp.model.vo.Business;
import com.kh.fp.model.vo.Member;

public interface MemberDao {
	
	int insertMember(SqlSessionTemplate session,Member m);
	
	Member selectMember(SqlSessionTemplate session,String userId);
	
	int insertBusiness(SqlSessionTemplate session,Business b);
	
	Business selectBusiness(SqlSessionTemplate session,String userId);
	
	Member selectMemberName(SqlSessionTemplate session, String name);
	
	

}
