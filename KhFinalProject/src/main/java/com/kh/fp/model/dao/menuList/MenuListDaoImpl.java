package com.kh.fp.model.dao.menuList;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.fp.model.vo.Review;
import com.kh.fp.model.vo.Store;

@Repository
public class MenuListDaoImpl implements MenuListDao {

	@Override
	public List<Store> selectMenuList(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("menuList.selectMenuList");
	}

	@Override
	public List<Store> selectMenuList(SqlSessionTemplate session, String category) {
		// TODO Auto-generated method stub
		return session.selectList("menuList.selectMenuListCategory", category);
	}

	@Override
	public Review selectReview(SqlSessionTemplate session, int s_no) {
		// TODO Auto-generated method stub
		return session.selectOne("review.selectReview", s_no);
	}

	
}
