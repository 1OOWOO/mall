package com.example.mall.mapper;

import java.util.List;
import java.util.Map;

import javax.xml.transform.ErrorListener;

import org.apache.ibatis.annotations.Mapper;

import com.example.mall.vo.Cart;

@Mapper
public interface CartMapper {
	// 오자윤 : 장바구니 항목 가져오기
	Map<String, Object> selectedCart(Integer cartNo);
	
	// 오자윤 : 장바구니 항목 추가
	int insertCart(Cart cart);
	
	// 오자윤 : 장바구니 항목 조회
	List<Map<String, Object>> getCartItem(String customerMail);
	
	// 오아림 : 카트 찜기능
	Integer addToCart(Cart cart);
}
