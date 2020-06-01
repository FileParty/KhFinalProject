package com.kh.fp.model.dao.member;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.fp.model.vo.Business;
import com.kh.fp.model.vo.Delivery;
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
	public int updateMemberPw(SqlSessionTemplate session, Member m) {
		// TODO Auto-generated method stub
		return session.update("member.updateMemberPw", m);
	}
	
	@Override
	public int updateBusinessPw(SqlSessionTemplate session, Business b) {
		// TODO Auto-generated method stub
		return session.update("member.updateBusinessPw", b);
	}

	@Override
	public Member selectMemberId(SqlSessionTemplate session, String m_email) {
		// TODO Auto-generated method stub
		return session.selectOne("member.selectMemberId",m_email);
	}

	@Override
	public Business selectBusinessId(SqlSessionTemplate session, String b_email) {
		// TODO Auto-generated method stub
		return session.selectOne("member.selectBusinessId", b_email);
	}

	@Override
	public Member selectKakao(SqlSessionTemplate session, String kname) {
		// TODO Auto-generated method stub
		return session.selectOne("member.selectKakao",kname);
	}

	@Override
	public Member selectNaverM(SqlSessionTemplate session, String email) {
		// TODO Auto-generated method stub
		return session.selectOne("member.selectNaverM",email);
	}

	@Override
	public int insertDelivery(SqlSessionTemplate session, Member mb) {
		// TODO Auto-generated method stub
		return session.insert("member.insertDelivery", mb);
	}

	@Override
	public Member selectDelivery(SqlSessionTemplate session, Member m) {
		// TODO Auto-generated method stub
		return session.selectOne("member.selectDelivery", m);
	}

	@Override
	public Delivery selectDeliveryI(SqlSessionTemplate session, Member m) {
		// TODO Auto-generated method stub
		return session.selectOne("member.selectDeliveryI",m);
	}

	@Override
	public Member selectGoogle(SqlSessionTemplate session, String name) {
		// TODO Auto-generated method stub
		return session.selectOne("member.selectGoogle", name);
	}

	@Override
	public Member selectFacebook(SqlSessionTemplate session, String email) {
		// TODO Auto-generated method stub
		return session.selectOne("member.selectFacebook", email);
	}
	
	
	
	
	


	
	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	

	
	
	
	
	
	
	

}
