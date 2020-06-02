package com.kh.fp.model.service.banner;

import java.util.Map;

public interface BannerService {

	int insertCoupon(Map<String,Integer> cp);

	int selectCoupon(int m_No);

}
