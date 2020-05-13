package com.kh.fp.model.servier.member;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fp.model.dao.member.MemberDao;
import com.kh.fp.model.vo.Business;
import com.kh.fp.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao dao;
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public int insertMember(Member m) {
		// TODO Auto-generated method stub
		return dao.insertMember(session, m);
	}

	@Override
	public Member selectMember(String userId) {
		// TODO Auto-generated method stub
		return dao.selectMember(session,userId);
	}

	@Override
	public int insertBusiness(Business b) {
		// TODO Auto-generated method stub
		return dao.insertBusiness(session,b);
	}

	@Override
	public Business selectBusiness(String userId) {
		// TODO Auto-generated method stub
		return dao.selectBusiness(session,userId);
	}
	
	
	
	
	
	

}
