package com.kh.fp.model.dao.member;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.fp.model.vo.Business;
import com.kh.fp.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao {
	
	@Override
	public int insertMember(SqlSessionTemplate session, Member m) {
		// TODO Auto-generated method stub
		return session.insert("member.insertMember",m);
	}

	@Override
	public Member selectMember(SqlSessionTemplate session, String userId) {
		// TODO Auto-generated method stub
		return session.selectOne("member.selectMember", userId);
	}

	@Override
	public int insertBusiness(SqlSessionTemplate session, Business b) {
		// TODO Auto-generated method stub
		return session.insert("member.insertBusiness",b);
	}

	@Override
	public Business selectBusiness(SqlSessionTemplate session, String userId) {
		// TODO Auto-generated method stub
		return session.selectOne("member.selectBusiness", userId);
	}

	@Override
	public Member selectMemberName(SqlSessionTemplate session, String name) {
		// TODO Auto-generated method stub
		return session.selectOne("member.selectMemberName",name);
	}

	@Override
	public Business selectBusinessId(SqlSessionTemplate session, String userId) {
		// TODO Auto-generated method stub
		return session.selectOne("member.selectBusinessId", userId);
	}
	
	
	
	
	
	
	
	
	
	

}
