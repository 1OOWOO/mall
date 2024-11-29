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

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class OrdersController {
	@Autowired OrdersService ordersService;
	
	// Author : 오아림
	// /admin/ordersList
	@GetMapping("/admin/ordersList")
	public String ordersList(Model model) {
		Map<String, Object> map = new HashMap<>();
        List<Map<String, Object>> ordersList = ordersService.getOrdersList(map);
        model.addAttribute("ordersList", ordersList);
        log.debug("Orders List Size: " + ordersList.size());
        
        return "admin/ordersList";
	}
	
	// /admin/ordersList - 주문상태, 결제방법 수정
	@PostMapping("/admin/ordersList")
	public String modifyOrders(@RequestParam Integer ordersNo
					            ,@RequestParam String paymentState) {
		Map<String, Object> map = new HashMap<>();
		map.put("orderId", ordersNo);
		map.put("paymentState", paymentState);
		log.debug("orderId: "+ordersNo.toString());
		
		ordersService.modifyOrders(map);
		
		return "redirect:/admin/ordersList"; 
	}
}