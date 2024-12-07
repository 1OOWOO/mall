package com.example.mall.controller;

import com.example.mall.service.AddressService;
import com.example.mall.vo.Address;
import com.example.mall.vo.Customer;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Slf4j
@Controller
public class AddressController {
    @Autowired
    private AddressService addressService;

    // 고객 주소 가져오기
    public String addressList(HttpSession session, Model model) {
	    Customer loginCustomer = (Customer) session.getAttribute("loggedInCustomer");
	    if(loginCustomer == null) {
	    	return "redirect:/login";
	    }
	    // 고객 이메일 가져오기
	    String customerMail = loginCustomer.getCustomerMail();
	    // 주소 목록 가져오기
	    List<Address> addressList = addressService.AddressListByCustomerMail(customerMail);
	    model.addAttribute("addressList", addressList);
	    log.debug("addressList--------->" + addressList);
	    
	    return "customer/payment";
    }
    
    // 주소 검색 처리
    @PostMapping("/searchAddress")
    public String searchAddress(@RequestParam("searchAddress") String keyword, Model model) {
        List<Address> addressList = addressService.searchAddresses(keyword);
        model.addAttribute("addressList", addressList); // 검색 결과 전달
        return "signUp"; // 회원가입 페이지로 결과 포함하여 반환
    }
}
