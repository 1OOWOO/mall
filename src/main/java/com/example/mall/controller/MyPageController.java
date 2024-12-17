package com.example.mall.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.mall.service.CustomerService;
import com.example.mall.service.OrdersService;
import com.example.mall.vo.Customer;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MyPageController {
	@Autowired
	private CustomerService customerService;

	@Autowired
	private OrdersService ordersService;

	@GetMapping("/customer/myPage")
	public String myPage(HttpSession session, Model model) {
		// 로그인된 사용자 확인
		Customer loggedInCustomer = (Customer) session.getAttribute("loggedInCustomer");
		if (loggedInCustomer == null) {
			log.error("로그인된 사용자가 없습니다.");
			return "redirect:/login"; // 로그인 페이지로 리다이렉트
		}

		String customerMail = loggedInCustomer.getCustomerMail();

		// 고객 정보 가져오기
		Map<String, Object> customer = customerService.selectCustomerOne(customerMail);
		model.addAttribute("customer", customer);

		// 주문 목록 가져오기
		Map<String, Object> map = new HashMap<>();
		map.put("customerMail", customerMail); // 고객 이메일 조건 추가
		List<Map<String, Object>> ordersList = ordersService.getOrdersList(map);
		model.addAttribute("ordersList", ordersList);

		log.debug("고객 정보: {}", customer);
		log.debug("주문 목록 크기: {}", ordersList.size());

		// customer/myPage로 데이터 전달
		return "customer/myPage";
	}
}
