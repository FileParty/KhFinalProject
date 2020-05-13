package com.kh.fp.model.service.mypage;

import java.util.List;
import java.util.Map;

public interface MypageService {
	
	int getTotalCount(String userId);
	
	List<Map<String, String>> selectOrder(String userId, int cPage, int numPerPage);
	
	List<Map<String, String>> selectOrderMenu(int o_no);

}
