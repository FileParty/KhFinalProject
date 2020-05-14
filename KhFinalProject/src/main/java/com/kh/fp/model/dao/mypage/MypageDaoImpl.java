package com.kh.fp.model.dao.mypage;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MypageDaoImpl implements MypageDao {

	@Override
	public int getTotalCount(SqlSessionTemplate session, int o_no) {
		return session.selectOne("mypage.totalCount", o_no);
	}

	@Override
	public List<Map<String, String>> selectOrder(SqlSessionTemplate session, int o_no, int cPage, int numPerPage) {
		return session.selectList("mypage.selectOrder", o_no, new RowBounds((cPage-1)*numPerPage,numPerPage));
	}

	@Override
	public List<Map<String, String>> selectOrderMenu(SqlSessionTemplate session, int o_no) {
		return session.selectList("mypage.selectOrderMenu", o_no);
	}

	@Override
	public int reviewTotalCount(SqlSessionTemplate session, int m_no) {
		return session.selectOne("mypage.selectReviewCount", m_no);
	}

	@Override
	public List<Map<String, String>> selectReview(SqlSessionTemplate session, int m_no, int cPage, int numPerPage) {
		return session.selectList("mypage.selectReview", m_no, new RowBounds((cPage-1)*numPerPage,numPerPage));
	}

	@Override
	public List<String> selectReviewImg(SqlSessionTemplate session, Map<String, String> map) {
		return session.selectList("mypage.selectReviewImg", map);
	}

	@Override
	public List<Map<String, String>> selectPrefer(SqlSessionTemplate session, int m_no) {
		return session.selectList("mypage.selectPrefer", m_no);
	}

	@Override
	public int delectWatchList(SqlSessionTemplate session, Map<String, String> map) {
		return session.delete("mypage.delectWatchList", map);
	}

	@Override
	public List<Map<String, String>> selectCoupon(SqlSessionTemplate session, int m_no) {
		return session.selectList("mypage.selectCoupon", m_no);
	}

	@Override
	public int memberUpdate(SqlSessionTemplate session, Map<String, String> map) {
		return session.selectOne("mypage.memberUpdate", map);
	}

	
	
	
	
	
	
	
	
	
	
	
}
