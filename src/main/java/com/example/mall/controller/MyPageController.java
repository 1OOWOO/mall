package com.example.mall.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpSession;
@Controller
public class MyPageController {
	// 로그인 폼 이동
    @GetMapping("/customer/myPage")
    public String myPage(HttpSession session) {
        return "customer/myPage"; 
    }
}
