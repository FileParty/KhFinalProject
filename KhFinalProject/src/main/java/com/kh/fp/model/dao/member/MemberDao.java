package com.kh.fp.model.dao.member;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.fp.model.vo.Member;

public interface MemberDao {
	
	int insertMember(SqlSessionTemplate session,Member m);
	
	Member selectMember(SqlSessionTemplate session,String userId);

}
