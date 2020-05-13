package com.kh.fp.model.dao.mypage;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public interface MypageDao {
	
	int getTotalCount(SqlSessionTemplate session, String userId);
	
	List<Map<String, String>> selectOrder(SqlSessionTemplate session, String userId, int cPage, int numPerPage);
	
	List<Map<String, String>> selectOrderMenu(SqlSessionTemplate session, int o_no);

}
