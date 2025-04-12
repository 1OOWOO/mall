package com.example.mall.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.mall.service.OrdersService;
import com.example.mall.vo.Staff;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class OrdersController {
	@Autowired
	OrdersService ordersService;

	// Author : 오아림
	// /admin/ordersList
	@GetMapping("/admin/ordersList")
	public String ordersList(@RequestParam(value= "page", defaultValue = "1") int page,
							@RequestParam(value = "pageSize", defaultValue = "10") int pageSize,
							@RequestParam(value = "searchKeyword", required = false) String searchKeyword,
							Model model) {
    
		Map<String, Object> map = new HashMap<>();
		// 페이징-> 0일 경우 1로 초기화
		int currentPage = Math.max(1, page); // page가 1보다 작으면 1로 설정
		int size = Math.max(1, pageSize); // pageSize가 1보다 작으면 1로 설정
		int offset = (currentPage -1) * size;
		
	    map.put("pageSize", size);
	    map.put("offset", offset);
	    
	    if (searchKeyword != null && !searchKeyword.isEmpty()) {
	        map.put("customerMail", searchKeyword);
	    }
	    
		List<Map<String, Object>> ordersList = ordersService.getOrdersList(map);
		int totalCount = ordersService.getOrdersListCount(map); // 검색 조건에 맞는 총 개수 조회
	    int totalPages = (int) Math.ceil((double) totalCount / size);
	    
	    int numPageBlock = 10; // 페이지 번호 그룹 사이즈 (표시할 페이지 번호 개수)
	    int beginPageNum = ((currentPage - 1) / numPageBlock) * numPageBlock + 1;
	    int endPageNum = Math.min(beginPageNum + numPageBlock - 1, totalPages);

		model.addAttribute("ordersList", ordersList);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("pageSize", size);
		model.addAttribute("searchKeyword", searchKeyword);
		model.addAttribute("beginPageNum", beginPageNum);
		model.addAttribute("endPageNum", endPageNum);
		
		log.debug("Orders List Size: " + ordersList.size());
		log.debug("currentPage: " + currentPage);
		log.debug("totalPages: " + totalPages);

		return "admin/ordersList";
	}

	// /admin/ordersList - 주문상태, 결제방법 수정
	@PostMapping("/admin/ordersList")
	public String modifyOrders(@RequestParam Integer ordersNo, @RequestParam String paymentState) {
		log.debug("파라미터 paymentState: " + paymentState);
		paymentState = paymentState.replace(",", "").trim(); // ','가 포함된 값이 들어와 ',' 자르기

		Map<String, Object> map = new HashMap<>();
		map.put("ordersNo", ordersNo);
		map.put("paymentState", paymentState);
		log.debug("ordersNo: " + ordersNo.toString());
		log.debug("paymentState: " + paymentState);

		ordersService.modifyOrders(map);

		return "redirect:/admin/ordersList";
	}
}
