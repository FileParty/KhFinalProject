package com.kh.fp.controller.business.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.fp.common.MyException;
import com.kh.fp.controller.business.model.dao.StoreDaoImpl;
import com.kh.fp.model.vo.Sales;
import com.kh.fp.model.vo.StoreEnroll;

@Service
public class StoreServiceImpl implements StoreService {

	
	@Autowired
	SqlSessionTemplate session;
	
	@Autowired
	StoreDaoImpl dao;
	
	@Autowired
	Logger logger;

	@Override
	@Transactional
	public int insertStore(StoreEnroll se, List<String> files) throws MyException {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		
		int result = dao.insertStore(session,se);
		
		if(result==0) {
			throw new MyException("가게 등록 에러!");
		}
		
		for(String s : se.getCategory()) {
			
			map.put("sno", se.getSno());
			map.put("scategory",s);
			result = dao.insertStoreCategory(session,map);
			if(result==0) {
				throw new MyException("카테고리 등록 에러!");
			}
					
		}
		
		result = dao.insertBestCategory(session,se.getSno());
		
		if(result==0) {
			throw new MyException("대표 메뉴 카테고리 등록 에러!");
		}
		
		if(!files.isEmpty()) {
			for(String f : files) {
				map.put("sno", se.getSno());
				map.put("simg",f);
				result = dao.insertStoreImage(session,map);
				if(result==0) {
					throw new MyException("사진 등록 에러!");
				}
						
			}
		}
		
		return result;
	}

	@Override
	public List<Map<String, Object>> getStoresDetail(int no) {
		// TODO Auto-generated method stub
		List<Map<String, Object>> stores =dao.getStoresDetail(session,no);
		for(Map<String, Object> m : stores) {

			List<Map<String, Object>> category = dao.getStoresDetailcategory(session, m.get("S_NO"));
			List<Map<String, Object>> files= dao.getStoresDetailfiles(session,m.get("S_NO"));
			
			m.put("category", category);
			m.put("files",files);
			
		}
		return stores;
	}

	@Override
	public List<Map<String, Object>> getStoresDetailcategory(int no) {
		// TODO Auto-generated method stub
		return dao.getStoresDetailcategory(session,no);
	}

	@Override
	public List<Map<String, Object>> getStoresDetailfiles(int no) {
		// TODO Auto-generated method stub
		return dao.getStoresDetailfiles(session,no);
	}

	@Override
	public Map<String, Object> getStoresUpdate(int no) {
		// TODO Auto-generated method stub
		Map<String, Object> m=dao.getStoresUpdate(session,no);
		List<Map<String, Object>> category = dao.getStoresDetailcategory(session, no);
		m.put("category", category);
		return m;
	}

	@Override
	@Transactional
	public int storeUpdate(StoreEnroll s) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		
		int result = dao.storeUpdate(session,s);
		
		if(result==0) {
			throw new MyException("가게 수정 에러!");
		}
		
		result = dao.deleteCategory(session,s.getSno());
		
		if(result==0) {
			throw new MyException("카테고리 수정 에러1!");
		}
		
		for(String ca : s.getCategory()) {
			
			map.put("sno", s.getSno());
			map.put("scategory",ca);
			result = dao.insertStoreCategory(session,map);
			if(result==0) {
				throw new MyException("카테고리 수정 에러2!");
			}
					
		}
		
		return result;
	}

	@Override
	public List<Map<String, Object>> getStoresInfo(int no) {
		// TODO Auto-generated method stub
		return dao.getStoresInfo(session,no);
	}


	@Override
	public List<Sales> getSales(Object no) {
		// TODO Auto-generated method stub
		return dao.getSales(session, no);
	}

	@Override
	public List<Map<String, Object>> getOrderInfo(Object no) {
		// TODO Auto-generated method stub
		return dao.getOrderInfo(session, no);
	}

	@Override
	public List<Map<String, Object>> getSaleMonth(Object no) {
		// TODO Auto-generated method stub
		return dao.getSaleMonth(session,no);
	}

	
	
	
	
	
	
	
	
	
}
