package com.kh.fp.model.dao.menuList;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.fp.model.vo.Review;
import com.kh.fp.model.vo.Store;

@Repository
public class MenuListDaoImpl implements MenuListDao {

	//페이지 전환
	@Override
	public List<Store> selectMenuList(SqlSessionTemplate session, int cPage, int numperPage, Map map) {
		// TODO Auto-generated method stub
		return session.selectList("menuList.selectMenuList", map, new RowBounds((cPage-1)*numperPage,numperPage));
	}

	//filter
	@Override
	public List<Store> selectMenuListFilter(SqlSessionTemplate session, int cPage, int numperPage, Map map) {
		// TODO Auto-generated method stub
		return session.selectList("menuList.selectMenuListFilter", map, new RowBounds((cPage-1)*numperPage,numperPage));
	}

	//totalData
	@Override
	public int selectMenuCount(SqlSessionTemplate session, Map map) {
		// TODO Auto-generated method stub
		return session.selectOne("menuList.selectMenuCount", map);
	}
		
	@Override
	public Review selectReview(SqlSessionTemplate session, int s_no) {
		// TODO Auto-generated method stub
		return session.selectOne("review.selectReview", s_no);
	}

	//검색
	@Override
	public List<Store> selectMenuList(SqlSessionTemplate session, Map map) {
		// TODO Auto-generated method stub
		return session.selectList("menuList.searchMenuList", map);
	}

	
	
	

	
}
