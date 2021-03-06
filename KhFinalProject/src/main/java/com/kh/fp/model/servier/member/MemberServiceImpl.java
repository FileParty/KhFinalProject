package com.kh.fp.model.servier.member;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fp.model.dao.member.MemberDao;
import com.kh.fp.model.vo.Business;
import com.kh.fp.model.vo.Delivery;
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

	@Override
	public int insertDelivery(Member mb) {
		// TODO Auto-generated method stub
		return dao.insertDelivery(session,mb);
	}

	@Override
	public Member selectDelivery(Member m) {
		// TODO Auto-generated method stub
		return dao.selectDelivery(session,m);
	}

	@Override
	public Delivery selectDeliveryI(Member m) {
		// TODO Auto-generated method stub
		return dao.selectDeliveryI(session,m);
	}

	@Override
	public Member selectGoogle(String name) {
		// TODO Auto-generated method stub
		return dao.selectGoogle(session,name);
	}

	@Override
	public Member selectFacebook(String email) {
		// TODO Auto-generated method stub
		return dao.selectFacebook(session,email);
	}

	@Override
	public int selectAttendance(int m_no) {
		return dao.selectAttendance(session, m_no);
	}

	@Override
	public void insertAttendance(int m_no) {
		dao.insertAttendance(session, m_no);
	}

	@Override
	public void updatePoint(int m_no) {
		dao.updatePoint(session, m_no);
	}
	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	

	
	
	
	
	
	

	
	
	

	
	
	
	
	
	
	
	
	
	
	

}
