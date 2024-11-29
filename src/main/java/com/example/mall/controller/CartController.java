package com.example.mall.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.mall.service.CartService;
import com.example.mall.service.GoodsService;
import com.example.mall.vo.Goods;

@Controller
public class CartController {
	@Autowired private CartService cartService;
	@Autowired private GoodsService goodsService;
	
	// Author : 오아림
	// /cutomer/addToCart
	@PostMapping("/customer/addToCart")
	public String addToCart(@RequestParam("goodsNo") Integer goodsNo
				            ,@RequestParam("cartAmount") Integer cartAmount
				            ,@RequestParam("customerMail") String customerMail) {
		/*
		 * Goods goods = goodsService.getGoodsById(goodsNo); // 상품 정보 받아오기
		 * 
		 * if (goods != null) { cartService.addToCart(goods, cartAmount, customerMail);
		 * }
		 */
		
		return "redirect:/cartList";
		}
}
