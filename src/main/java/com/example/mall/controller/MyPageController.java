package com.example.mall.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.mall.service.CustomerService;
import com.example.mall.service.OrdersService;
import com.example.mall.vo.Address;
import com.example.mall.vo.Customer;

import jakarta.servlet.http.HttpSession;
import jakarta.websocket.Session;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MyPageController {
	@Autowired
	private CustomerService customerService;

	@Autowired
	private OrdersService ordersService;

	// Author : 오자윤
	// /customer/myPage/edit 수정페이지
	@PostMapping("/customer/myPage/edit/process")
	public String postEditMyPageProcess(@RequestParam String customerMail,
										@RequestParam(required = false) String newEmail,
										@RequestParam(required = false) String newPw,
										@RequestParam(required = false) String newAddressDetail,
										@RequestParam(required = false) Integer addressNo,
										HttpSession session, Model model) {
	    // 로그인된 사용자 확인 
	    Customer loggedInCustomer = (Customer) session.getAttribute("loggedInCustomer");
	    if (loggedInCustomer == null || !loggedInCustomer.getCustomerMail().equals(customerMail)) {
	        log.error("잘못된 접근 또는 로그인되지 않은 사용자입니다.");
	        return "redirect:/login";
	    }
	    
	    // 업데이트할 고객 정보 객체 생성
	    Customer updatedCustomer = new Customer();
	    updatedCustomer.setCustomerMail(customerMail);
	    // 업데이트할 고객 정보 설정
	    if (newEmail != null) {
	        updatedCustomer.setCustomerMail(newEmail);
	    }
	    if (newPw != null) {
	        updatedCustomer.setCustomerPw(newPw);
	    }

	    // 업데이트할 주소 정보 객체 생성
	    Address updatedAddress = new Address();
	    updatedAddress.setCustomerMail(customerMail); // FK 설정
	    updatedAddress.setAddressDetail(newAddressDetail);
	    updatedAddress.setAddressNo(addressNo); // 특정 주소 업데이트 시
	    
	    log.debug("updatedCustomer----------->" + updatedCustomer);
	    log.debug("updatedAddress----------->" + updatedAddress);

	    int result = customerService.updateCustomer(updatedCustomer, updatedAddress);
	    log.debug("result----------->" + result);
	    
	    if (result > 0) {
	        model.addAttribute("message", "개인 정보가 수정되었습니다.");
	        return "redirect:/customer/myPage"; // 수정 완료 후 마이페이지로 리다이렉트
	    } else {
	        model.addAttribute("errorMessage", "개인 정보 수정에 실패했습니다.");
	        // 수정 실패 시 수정 폼으로 다시 이동
	        Map<String, Object> customer = customerService.selectCustomerOne(customerMail);
	        model.addAttribute("customer", customer);
	        return "customer/editMyPage";
	    }
	}
	
	@PostMapping("/customer/myPage/edit")
	public String EditMypage(HttpSession session, Model model) {
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

		log.debug("고객 정보: {}", customer);
		
		return "customer/editMyPage";
	}
	
	
	@GetMapping("/customer/myPage")
	public String myPage(@RequestParam(value= "page", defaultValue = "1") int page,
			            @RequestParam(value = "pageSize", defaultValue = "5") int pageSize, 
			            HttpSession session, Model model) {
		
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
	    int currentPage = Math.max(1, page);
	    int size = Math.max(1, pageSize);
	    int offset = (currentPage - 1) * size;
	    map.put("pageSize", size);
	    map.put("offset", offset);
	    
		List<Map<String, Object>> ordersList = ordersService.getOrdersList(map);
	    int totalCount = ordersService.getOrdersListCount(map);
	    int totalPages = (int) Math.ceil((double) totalCount / size);
	    int numPageBlock = 5;
	    int beginPageNum = ((currentPage - 1) / numPageBlock) * numPageBlock + 1;
	    int endPageNum = Math.min(beginPageNum + numPageBlock - 1, totalPages);
	    
		model.addAttribute("ordersList", ordersList);
	    model.addAttribute("currentPage", currentPage);
	    model.addAttribute("totalPages", totalPages);
	    model.addAttribute("pageSize", size);
	    model.addAttribute("beginPageNum", beginPageNum);
	    model.addAttribute("endPageNum", endPageNum);

		log.debug("고객 정보: {}", customer);
		log.debug("주문 목록 크기: {}", ordersList.size());

		// customer/myPage로 데이터 전달
		return "customer/myPage";
	}
}
