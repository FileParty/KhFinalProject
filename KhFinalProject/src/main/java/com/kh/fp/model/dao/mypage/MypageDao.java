package com.kh.fp.model.dao.mypage;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public interface MypageDao {
	
	int getTotalCount(SqlSessionTemplate session, int o_no);
	
	List<Map<String, String>> selectOrder(SqlSessionTemplate session, int o_no, int cPage, int numPerPage);
	
	List<Map<String, String>> selectOrderMenu(SqlSessionTemplate session, int o_no);
	
	int reviewTotalCount(SqlSessionTemplate session, int m_no);
	
	List<Map<String, String>> selectReview(SqlSessionTemplate session, int m_no, int cPage, int numPerPage);
	
	List<String> selectReviewImg(SqlSessionTemplate session, Map<String, String> map);
	
	List<Map<String, String>> selectPrefer(SqlSessionTemplate session, int m_no);
	
	int delectWatchList(SqlSessionTemplate session, Map<String, String> map);
	
	List<Map<String, String>> selectCoupon(SqlSessionTemplate session, int m_no);
	
	int memberUpdate(SqlSessionTemplate session, Map<String, String> map);

}
