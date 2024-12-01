package com.example.mall.controller;

import com.example.mall.service.AddressService;
import com.example.mall.vo.Address;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class AddressController_BK {

//    @Autowired
//    private AddressService addressService;
//
//    
//    // 회원가입 페이지 표시 및 주소 검색 처리
//    @PostMapping("/signUp")
//    public String searchAddress(
//            @RequestParam(value = "searchAddress", required = false) String searchKeyword,
//            Model model) {
//        if (searchKeyword != null && !searchKeyword.isEmpty()) {
//            List<Address> addressList = addressService.searchAddresses(searchKeyword);
//            model.addAttribute("addressList", addressList);
//        }
//        return "signUp"; // JSP 파일명
//    }
}
