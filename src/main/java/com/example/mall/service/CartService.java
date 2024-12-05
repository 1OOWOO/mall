package com.example.mall.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.xml.transform.ErrorListener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.mall.mapper.CartMapper;
import com.example.mall.mapper.GoodsMapper;
import com.example.mall.mapper.PaymentMapper;
import com.example.mall.vo.Cart;
import com.example.mall.vo.Goods;

import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
public class CartService {
	@Autowired CartMapper cartMapper;
	@Autowired GoodsMapper goodsMapper;
	
	// 오자윤 : 장바구니 총합
	public long getCartByPayment(List<Map<String, Object>> cartList) {
	    // Map에서 totalPrice를 가져와 long으로 변환하고 모든 금액을 합산
	    long payment = cartList.stream()
	        .mapToLong(c -> {
	            Object totalPriceObj = c.get("totalPrice"); // totalPrice 값을 가져오기.
	            return totalPriceObj != null ? (long) totalPriceObj : 0; // null 체크 후 long으로 변환
	        })
	        .sum(); // 모든 가격을 합산
	    return payment;
 	}
	
	// 오자윤 : 장바구니 삭제
	public int removeCart(int cartNo) {
		return cartMapper.removeCart(cartNo);
	}
	
	// 오자윤 : 체크된 장바구니 가져오기
	public List<Map<String, Object>> getCartListOne(List<Integer> selectedCart) {
		List<Map<String, Object>> cartList = new ArrayList<>();
		for(Integer cartNo : selectedCart) {
			cartList.add(cartMapper.selectedCart(cartNo));
		}
		return cartList;
	}
	
	// 오자윤 : 장바구니 항목 추가
    public Integer addCart(Cart cart) {
        return cartMapper.insertCart(cart);
    }

    // 오자윤 : 장바구니 항목 조회
    public List<Map<String, Object>> getCartItem(String customerMail) {
        return cartMapper.getCartItem(customerMail);
    }

	// Author : 오아림
	public Integer addToCart(Goods goods, Integer cartAmount,String customerMail) {
		Cart cart = new Cart();
		cart.setGoodsNo(goods.getGoodsNo());
	    cart.setCustomerMail(customerMail);
	    cart.setCartAmount(cartAmount);
	    
	    return cartMapper.addToCart(cart);
	}
}
