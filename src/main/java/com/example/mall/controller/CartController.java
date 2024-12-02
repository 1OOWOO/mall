package com.example.mall.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.mall.service.CartService;
import com.example.mall.vo.Cart;
import com.example.mall.vo.Goods;

import org.springframework.ui.Model;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CartController {
	@Autowired private CartService cartService;
	
	
	// 오자윤 : 장바구니 페이지 (장바구니 추가)
	@PostMapping("/cart/add")
    public String addCartItem(@RequestParam String customerMail, @RequestParam int goodsNo, @RequestParam int cartAmount) {
        cartService.addCartItem(customerMail, goodsNo, cartAmount);
        return "redirect:/cart"; // 장바구니 페이지로 리다이렉트
    }

    // 장바구니 항목 조회
	@GetMapping("/customer/cart")
    public String getCartItems(HttpSession session, Model model) {
		/* String customerMail = (String) session.getAttribute("customerMail"); */
		String customerMail = "dfasdf@wix.com";
        List<Map<String, Object>> carts = cartService.getCartItem(customerMail);
        
        log.debug(carts+ "<---carts");
    	
        // 상품 정보 goods 테이블에서 가져오기
    	model.addAttribute("carts", carts);
    	
    	// 총 금액 계산
		/*
		 * int totalPrice = 0; for(Map<String, Object> cart : carts) { totalPrice +=
		 * (Integer) cart.get("price"); // 각 상품의 가격 더하기 }
		 * 
		 * int shippingFee = 2500; // 고정 배송비 int totalAmount = totalPrice + shippingFee;
		 * 
		 * model.addAttribute("totalPrice", totalPrice);
		 * model.addAttribute("shippingFee", shippingFee);
		 * model.addAttribute("totalAmount", totalAmount);
		 */
    	
        return "/customer/cart"; // 장바구니 페이지 반환
    }

	// 장바구니 수량 수정
    @PostMapping("/cart/update")
    public String updateCartItem(@RequestParam int cartNo, @RequestParam String customerMail, @RequestParam int cartAmount) {
        cartService.updateCartItem(cartNo, customerMail, cartAmount);
        return "redirect:/cartList"; // 장바구니 페이지로 리다이렉트
    }

    // 장바구니 항목 삭제
    @GetMapping("/cart/delete")
    public String deleteCartItem(@RequestParam int cartNo, @RequestParam String customerMail) {
        cartService.deleteCartItem(cartNo, customerMail);
        return "redirect:/cartList"; // 장바구니 페이지로 리다이렉트
    }

    // 장바구니 비우기
    @PostMapping("/cart/clear")
    public String clearCart(@RequestParam String customerMail) {
        cartService.clearCart(customerMail);
        return "redirect:/cartList"; // 장바구니 페이지로 리다이렉트
    }
	
	
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
