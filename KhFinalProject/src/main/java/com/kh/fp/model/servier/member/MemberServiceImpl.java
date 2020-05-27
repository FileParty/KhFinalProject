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

	@Override
	public Member selectMemberName(String name) {
		// TODO Auto-generated method stub
		return dao.selectMemberName(session,name);
	}

	@Override
	public int updateMemberPw(Member m) {
		// TODO Auto-generated method stub
		return dao.updateMemberPw(session,m);
	}
	
	@Override
	public int updateBusinessPw(Business b) {
		// TODO Auto-generated method stub
		return dao.updateBusinessPw(session,b);
	}

	@Override
	public Member selectMemberId(String m_email) {
		// TODO Auto-generated method stub
		return dao.selectMemberId(session,m_email);
	}

	@Override
	public Business selectBusinessId(String b_email) {
		// TODO Auto-generated method stub
		return dao.selectBusinessId(session,b_email);
	}

	@Override
	public Member selectKakao(String kname) {
		// TODO Auto-generated method stub
		return dao.selectKakao(session,kname);
	}

	@Override
	public Member selectNaverM(String email) {
		// TODO Auto-generated method stub
		return dao.selectNaverM(session,email);
	}
	
	
	
	

	
	
	
	
	
	

	
	
	

	
	
	
	
	
	
	
	
	
	
	

}
