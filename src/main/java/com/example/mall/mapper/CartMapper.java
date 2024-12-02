package com.example.mall.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.mall.vo.Cart;

@Mapper
public interface CartMapper {
	// 오자윤 : 장바구니 항목 추가
	int  addCartItem(String customerMail, int goodNo, int cartAmount);
	
	// 오자윤 : 장바구니 항목 조회
	List<Cart> getCartItem(String customerMail);
	
	// 오자윤 : 장바구니 수량 수정
	int updateCartItem(int cartNo, String customerMail, int cartAmount);
	
	// 오자윤 : 장바구니 항목 삭제
	int deleteCartItem(int cartNo, String customerMail);
	
	// 오자윤 : 장바구니 비우기
	int clearCart(String customerMail);
	
	// 오아림 : 카트 찜기능
	Integer addToCart(Cart cart);
}
