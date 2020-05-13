package com.kh.fp.model.dao.member;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;


import com.kh.fp.model.vo.Member_SH;

public interface MemberDao_SH {

	Object selectMemberPay(SqlSessionTemplate session, int m_no);



}
