package com.example.mall.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller // Servlet 역활
public class HelloController {
	@GetMapping("/hello") // doGet() 역활
	public String hello() {
		return "hello"; // /WEB-INF/view/hello.jsp 포워딩 역활
	}
}