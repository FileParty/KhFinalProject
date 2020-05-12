package com.kh.fp.model.dao.member;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class MemberDaoImpl_SH implements MemberDao_SH {@Override
	
	public Object selectMemberPay(SqlSessionTemplate session, int m_no) {
		// TODO Auto-generated method stub
		return session.selectOne("member.selectMemberPay",m_no);
	}

}
