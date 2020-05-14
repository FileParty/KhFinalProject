package com.kh.fp.controller.business.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.fp.common.MyException;
import com.kh.fp.controller.business.model.dao.StoreDaoImpl;
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
	public int insertStore(StoreEnroll se, List<String> files) {
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

	
	
	
	
	
}
