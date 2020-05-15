package com.kh.fp.model.service.mypage;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fp.model.dao.mypage.MypageDao;
import com.kh.fp.model.vo.Member;

@Service
public class MypageServiceImpl implements MypageService {
	
	@Autowired
	private MypageDao dao;
	
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public int getTotalCount(int o_no) {
		return dao.getTotalCount(session, o_no);
	}

	@Override
	public List<Map<String, String>> selectOrder(int o_no, int cPage, int numPerPage) {
		return dao.selectOrder(session, o_no, cPage, numPerPage);
	}

	@Override
	public List<Map<String, String>> selectOrderMenu(int o_no) {
		// TODO Auto-generated method stub
		return dao.selectOrderMenu(session, o_no);
	}

	@Override
	public int reviewTotalCount(int m_no) {
		return dao.reviewTotalCount(session, m_no);
	
	}

	@Override
	public List<Map<String, String>> selectReview(int m_no, int cPage, int numPerPage) {
		return dao.selectReview(session, m_no, cPage, numPerPage);
	}

	@Override
	public List<String> selectReviewImg(Map<String, String> map) {
		return dao.selectReviewImg(session, map);
	}

	@Override
	public List<Map<String, String>> selectPrefer(int m_no) {
		return dao.selectPrefer(session, m_no);
	}

	@Override
	public int delectWatchList(Map<String, String> map) {
		return dao.delectWatchList(session, map);
	}

	@Override
	public List<Map<String, String>> selectCoupon(int m_no) {
		return dao.selectCoupon(session, m_no);
	}

	@Override
	public int memberUpdate(Map<String, String> map) {
		return dao.memberUpdate(session, map);
	}

	@Override
	public Member memberSelect(int m_no) {
		return dao.memberSelect(session, m_no);
	}

	@Override
	public int memberDelete(int m_no) {
		return dao.memberDelete(session, m_no);
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
