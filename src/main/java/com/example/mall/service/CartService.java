package com.example.mall.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.mall.mapper.CartMapper;
import com.example.mall.vo.Cart;
import com.example.mall.vo.Goods;

@Service
public class CartService {
	@Autowired CartMapper cartMapper;
	
	// Author : 오아림
	public Integer addToCart(Goods goods, Integer cartAmount,String customerMail) {
		Cart cart = new Cart();
		cart.setGoodsNo(goods.getGoodsNo());
	    cart.setCustomerMail(customerMail);
	    cart.setCartAmount(cartAmount);
	    
	    return cartMapper.addToCart(cart);
	}
}
