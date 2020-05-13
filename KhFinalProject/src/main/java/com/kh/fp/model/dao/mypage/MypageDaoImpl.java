package com.kh.fp.model.dao.mypage;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MypageDaoImpl implements MypageDao {

	@Override
	public int getTotalCount(SqlSessionTemplate session, String userId) {
		return session.selectOne("mypage.totalCount", userId);
	}

	@Override
	public List<Map<String, String>> selectOrder(SqlSessionTemplate session, String userId, int cPage, int numPerPage) {
		return session.selectList("mypage.selectOrder", userId, new RowBounds((cPage-1)*numPerPage,numPerPage));
	}

	@Override
	public List<Map<String, String>> selectOrderMenu(SqlSessionTemplate session, int o_no) {
		return session.selectList("mypage.selectOrderMenu", o_no);
	}

}
