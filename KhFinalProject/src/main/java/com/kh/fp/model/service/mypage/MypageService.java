package com.kh.fp.model.service.mypage;

import java.util.List;
import java.util.Map;

import com.kh.fp.model.vo.Member;

public interface MypageService {
	
	int getTotalCount(int m_no);
	
	List<Map<String, String>> selectOrder(int m_no, int cPage, int numPerPage);
	
	List<Map<String, String>> selectOrderMenu(int m_no);
	
	int reviewTotalCount(int m_no);
	
	List<Map<String, String>> selectReview(int m_no, int cPage, int numPerPage);
	
	List<String> selectReviewImg(Map<String, String> map);

	List<Map<String, String>> selectPrefer(int m_no);
	
	int delectWatchList(Map<String, String> map);
	
	List<Map<String, String>> selectCoupon(int m_no);
	
	int memberUpdate(Map<String, String> map);
	
	Member memberSelect(int m_no);
	
	int memberDelete(int m_no);
	
	int insertReview(Map<String, String> map);
	
	int insertReviewImg(Map<String, String> map);
	
	int updateReviewTaste(Map<String, String> map);
	
	int updateReviewAmount(Map<String, String> map);
	
	int updateReviewDelivery(Map<String, String> map);

	int updateReviewCount(Map<String, String> map);
	
	int updatePoint(Map<String, String> map);
	
	int updateReviewFlag(Map<String, String> map);
	
	
	
	
}
