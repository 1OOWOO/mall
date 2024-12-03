package com.example.mall.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.mall.service.CustomerService;
import com.example.mall.vo.Customer;

import jakarta.servlet.http.HttpSession;
@Controller
public class MyPageController {
	@Autowired CustomerService customerService;
	// 로그인 폼 이동
    @GetMapping("/customer/myPage")
    public String myPage(HttpSession session, Model model) {
    	String customerMail = ((Customer)(session.getAttribute("loggedInCustomer"))).getCustomerMail();
    	// db에서 값을 가지고 와서 모델에다가 넣어주는 코드
    	model.addAttribute("customer", customerService.selectCustomerOne(customerMail));
        return "customer/myPage"; 
    }
}
