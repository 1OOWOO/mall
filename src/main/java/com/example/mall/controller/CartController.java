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
import org.springframework.ui.Model;

import jakarta.servlet.http.HttpSession;

@Controller
public class CartController {
	@Autowired private CartService cartService;
	
	@GetMapping("/cart")
	public String getCartItems1(HttpSession session, Model model) {
		String customerMail = (String) session.getAttribute("customerMail");
		List<Map<String, Object>> carts = cartService.getCartItems(customerMail);
		
	// 오자윤 : 상품 정보 goods 테이블에서 가져오기
	for(Map<String, Object> cart : carts) {
		Integer goodsNo = (Integer) cart.get("goodsNo");
		Map<String, Object> goods = cartService.getGoodsById(goodsNo);
		cart.put("goodsTitle", goods.get("goodsTitle"));
		cart.put("goodsPrice", goods.get("goodsPrice"));
		cart.put("imageUrl", goods.get("imageUrl")); //image URL 추가
		cart.put("goodsState", goods.get("goodsState")); // 옵션추가
	}
	
	model.addAttribute("carts",carts);
	
	// 총 금액 계산
	
	return "cart";
	}
	
	// 오자윤 : 장바구니 페이지 (장바구니 추가)
	@PostMapping("/cart/add")
    public String addCartItem(@RequestParam String customerMail, @RequestParam int goodsNo, @RequestParam int cartAmount) {
        cartService.addCartItem(customerMail, goodsNo, cartAmount);
        return "redirect:/cart"; // 장바구니 페이지로 리다이렉트
    }

    // 장바구니 항목 조회
	@GetMapping("/cart")
    public String getCartItems(HttpSession session, Model model) {
        String customerMail = (String) session.getAttribute("customerMail");
        List<Cart> cartItem = cartService.getCartItems(customerMail);
        model.addAttribute("cartItem", cartItem);
        return "cart"; // 장바구니 페이지 반환
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
