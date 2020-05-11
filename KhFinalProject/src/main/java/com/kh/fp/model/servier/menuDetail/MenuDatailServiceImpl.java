package com.kh.fp.model.servier.menuDetail;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fp.model.dao.menuDetail.MenuDatailDao;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MenuDatailServiceImpl implements MenuDatailService {
	
	@Autowired
	private MenuDatailDao dao;
	@Autowired
	private SqlSessionTemplate session;
	
	

}
