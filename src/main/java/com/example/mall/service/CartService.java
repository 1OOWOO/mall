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

@Service
@Transactional
public class CartService {
	@Autowired CartMapper cartMapper;
	@Autowired GoodsMapper goodsMapper;
	
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
