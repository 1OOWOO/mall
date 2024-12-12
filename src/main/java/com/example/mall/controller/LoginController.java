package com.example.mall.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.mall.service.CustomerService;
import com.example.mall.service.StaffService;
import com.example.mall.vo.Customer;
import com.example.mall.vo.Staff;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class LoginController {

    @Autowired
    private CustomerService customerService;
    
    @Autowired
    private StaffService staffService; // StaffService 추가

    // 로그인 폼 이동
    @GetMapping("/login")
    public String login(HttpSession session) {
        return "/login"; 
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
        // 세션 유효시간 30분
        session.setMaxInactiveInterval(30*60);
        return "redirect:/hello"; // 로그인 성공 시 홈으로 리다이렉트
    }
    // 직원 로그인 페이지 이동
    @GetMapping("admin/staffLogin")
    public String staffLogin() {
        return "admin/staffLogin"; // staffLogin.html 리턴
    }
    
    // 직원 로그인 처리
    @PostMapping("admin/staffLogin")
    public String staffLogin(@RequestParam("staffId") String staffId,
                             @RequestParam("staffPw") String staffPw,
                             Model model, HttpSession session) {
        // 로그인 시도
        Staff loggedInStaff = staffService.login(staffId, staffPw);

        if (loggedInStaff == null) {
            model.addAttribute("message", "로그인에 실패했습니다. 아이디 또는 비밀번호를 확인하세요.");
            return "staffLogin"; // 로그인 실패 시 로그인 페이지로 다시 이동
        }

        // 로그인 성공, 세션에 사용자 정보 저장
        session.setAttribute("loggedInStaff", loggedInStaff);
        return "redirect:/admin/dashBoard"; // 직원 로그인 성공 시 대시보드로 리다이렉트
    }


    // 고객 로그아웃 처리
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // 세션 무효화
        return "redirect:/hello"; // 로그아웃 후 메인 페이지로 이동
    }
    
 // 관리자 로그아웃 처리
    @GetMapping("/admin/staffLogout")
    public String staffLogout(HttpSession session) {
        session.invalidate(); // 세션 무효화
        return "redirect:/admin/staffLogin"; // 로그아웃 후 메인 페이지로 이동
    }
}
