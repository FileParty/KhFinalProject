package com.kh.fp.controller.business.service;


import java.util.List;

import com.kh.fp.model.vo.StoreEnroll;

public interface StoreService {

	int insertStore(StoreEnroll s,List<String> files);
}
