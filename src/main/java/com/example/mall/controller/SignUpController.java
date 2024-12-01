package com.example.mall.controller;


import com.example.mall.service.AddressService;
import com.example.mall.service.CustomerService;
import com.example.mall.vo.Address;
import com.example.mall.vo.Customer;

import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Slf4j
@Controller
public class SignUpController {

    @Autowired
    private AddressService addressService;
    @Autowired
    private CustomerService customerService;

    // 회원가입 페이지 표시 및 주소 검색 처리
    @GetMapping("/signUp")
    public String signUp( String searchAddress, Model model) {
        if (searchAddress != null && !searchAddress.isEmpty()) {
            // 주소 검색 로직
            List<Address> addressList = addressService.searchAddresses(searchAddress);
            model.addAttribute("addressList", addressList);
        }
        return "signUp"; // JSP 파일명
    }

   
    // 우정 : 회원가입 처리 (signUp 페이지에서 직접 처리)
    @PostMapping("/signUp")
    public String register(Customer customer, Model model) {
        try {
            // 고객 등록
            customerService.registerCustomer(customer);

            // 성공 시 알림과 함께 hello 페이지로 리다이렉트
            model.addAttribute("message", "회원가입이 완료되었습니다.");
            return "redirect:/hello"; // 회원가입 성공 후 hello 페이지로 이동

        } catch (Exception e) {
            log.error("회원가입 중 오류 발생", e);
            model.addAttribute("message", "회원가입 중 오류가 발생했습니다. 다시 시도해주세요.");
            return "signUp"; // 오류 시 회원가입 페이지로 돌아가기
        }
    }

}
