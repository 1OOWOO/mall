package com.example.mall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.mall.mapper.CartMapper;
import com.example.mall.vo.Cart;
import com.example.mall.vo.Goods;

@Service
@Transactional
public class CartService {
	@Autowired CartMapper cartMapper;
	
	// 오자윤 : 상품 정보 가져오기
	public Goods getGoodsById(int goodsNo) {
		return goodsMapper.getGoodsById(goodsNo);
	}
	
	// 오자윤 : 장바구니 항목 추가
    public Integer addCartItem(String customerMail, int goodsNo, int cartAmount) {
        return cartMapper.addCartItem(customerMail, goodsNo, cartAmount);
    }

    // 오자윤 : 장바구니 항목 조회
    public List<Cart> getCartItems(String customerMail) {
        return cartMapper.getCartItem(customerMail);
    }

    // 오자윤 : 장바구니 수량 수정
    public Integer updateCartItem(int cartNo, String customerMail, int cartAmount) {
        return cartMapper.updateCartItem(cartNo, customerMail, cartAmount);
    }

    // 오자윤 : 장바구니 항목 삭제
    public Integer deleteCartItem(int cartNo, String customerMail) {
        return cartMapper.deleteCartItem(cartNo, customerMail);
    }

    // 오자윤 : 장바구니 비우기
    public Integer clearCart(String customerMail) {
        return cartMapper.clearCart(customerMail);
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
