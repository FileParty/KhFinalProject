package com.kh.fp.model.service.mypage;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fp.model.dao.mypage.MypageDao;

@Service
public class MypageServiceImpl implements MypageService {
	
	@Autowired
	private MypageDao dao;
	
	@Autowired
	private SqlSessionTemplate session;

}
