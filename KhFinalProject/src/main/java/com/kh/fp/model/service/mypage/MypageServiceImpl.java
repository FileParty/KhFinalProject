package com.kh.fp.model.service.mypage;

import java.util.List;
import java.util.Map;

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

	@Override
	public int getTotalCount(String userId) {
		return dao.getTotalCount(session, userId);
	}

	@Override
	public List<Map<String, String>> selectOrder(String userId, int cPage, int numPerPage) {
		return dao.selectOrder(session, userId, cPage, numPerPage);
	}

	@Override
	public List<Map<String, String>> selectOrderMenu(int o_no) {
		// TODO Auto-generated method stub
		return dao.selectOrderMenu(session, o_no);
	}
	
	
}
