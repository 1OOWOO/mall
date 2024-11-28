package com.example.mall.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.mall.service.CustomerService;
import com.example.mall.vo.Customer;

import jakarta.servlet.http.HttpSession;

@Controller
public class LoginController {

    @Autowired
    private CustomerService customerService;

    // 로그인 폼 이동
    @GetMapping("/login")
    public String login(HttpSession session) {
        // 이미 로그인된 상태라면 홈으로 리다이렉트
        if (session.getAttribute("loggedInCustomer") != null) {
            return "redirect:/hello";
        }
        return "/login"; // JSP 경로: customer/login.jsp
    }

    // 로그인 처리
    @PostMapping("/login")
    public String login(@RequestParam("customerMail") String customerMail,
                        @RequestParam("customerPw") String customerPw,
                        Model model, HttpSession session) {
        Customer paramCustomer = new Customer();
        paramCustomer.setCustomerMail(customerMail);
        paramCustomer.setCustomerPw(customerPw);

        // 로그인 시도
        Customer loggedInCustomer = customerService.login(paramCustomer);

        if (loggedInCustomer == null) {
            // 로그인 실패 메시지 설정
            model.addAttribute("message", "로그인에 실패했습니다. 이메일 또는 비밀번호를 확인하세요.");
            return "/login"; // 로그인 실패 시 로그인 페이지로 다시 이동
        }

        // 로그인 성공, 세션에 사용자 정보 저장
        session.setAttribute("loggedInCustomer", loggedInCustomer);
        return "redirect:/hello"; // 로그인 성공 시 홈으로 리다이렉트
    }

    // 로그아웃 처리
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // 세션 무효화
        return "redirect:/login"; // 로그아웃 후 로그인 페이지로 이동
    }
}
