package com.example.mall.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.mall.service.AddressService;
import com.example.mall.service.CartService;
import com.example.mall.vo.Address;
import com.example.mall.vo.Cart;
import com.example.mall.vo.Customer;
import com.example.mall.vo.Goods;

import org.springframework.ui.Model;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CartController {
	@Autowired
	CartService cartService;
	@Autowired
	AddressService addressService;

	// 오자윤 : 결제 폼
	@PostMapping("/customer/checkGoods")
	public String orderList(HttpSession session, Model model,
			@RequestParam(value = "selectedCart") List<Integer> selectedCart) {
		// 메일 가져오기
		String customerMail = ((String) session.getAttribute("loggedInCustomer"));
		log.debug("customerMail----->", customerMail);
		model.addAttribute("customerMail", customerMail);
		// 주소 리스트 가져오기
		List<Address> addressList = addressService.AddressListByCustomerMail(customerMail);
		log.debug("customerMail------>", addressList);
		model.addAttribute("addressList", addressList);
		// 카트 리스트 가져오기
		List<Map<String, Object>> cartList = cartService.getCartListOne(selectedCart);
		log.debug("cartList------>", cartList);
		model.addAttribute(cartList);

		// 총 결제가격 계산
		Long totalPrice = 0L;
		for (Map<String, Object> cart : cartList) {
			totalPrice += (Long) cart.get("totalPrice");
		}
		model.addAttribute("totalPrice", totalPrice);

		return "/customer/payment";
	}

	// 오자윤 : 장바구니 추가
	@PostMapping("/customer/addCart")
	public String addCart(Model model, Cart cart, HttpSession session) {
		Customer loggedInCustomer = (Customer) session.getAttribute("loggedInCustomer");
		
		if(loggedInCustomer == null) {
			// 로그인 안된 경우 로그인 페이지로 리다이렉트
			return "redirect:/login";
		} else {
			// 로그인된 경우 장바구니 추가
			cart.setCustomerMail(loggedInCustomer.getCustomerMail()); // 세션에서 로그인 -> cart에 설정
			cartService.addCart(cart);
			log.debug(cart.toString() + "----> cart");
			return "redirect:/customer/cart?customerMail=" + cart.getCustomerMail();
		}
	}

	// 오자윤 : 장바구니 삭제
	@GetMapping("/customer/deleteCart")
	public String deleteCart(@RequestParam int cartNo, HttpSession session) {
		Customer customerMail = (Customer) session.getAttribute("loggedInCustomer");
		log.debug("cartNo----->", cartNo);
		int row = cartService.removeCart(cartNo);

		if (row == 1) {
			log.debug("삭제 성공");
			return "redirect:/customer/cart?customerMail=" + customerMail.getCustomerMail();
		}
		log.debug("삭제 실패");
		return "redirect:/customer/cart?customerMail=" + customerMail.getCustomerMail();
	}

	// 오자윤 : 장바구니 항목 조회
	@GetMapping("/customer/cart")
	public String cartList(Model model, @RequestParam String customerMail) {
		// 주소 목록 가져오기
		List<Address> addressList = addressService.AddressListByCustomerMail(customerMail);
		model.addAttribute("addressList", addressList);
		// 장바구니 가져오기
		List<Map<String, Object>> cartList = cartService.getCartItem(customerMail);
		log.debug("고객 이메일---------> " + customerMail);
		log.debug("장바구니 항목 수-----------> " + cartList.size());

		model.addAttribute("cartList", cartList);
		log.debug("cartList--->" + cartList.toString());
		log.debug("addressList--->" + addressList.toString());
		model.addAttribute("customerMail", customerMail);

		return "/customer/cart"; // 장바구니 페이지 반환
	}

}
