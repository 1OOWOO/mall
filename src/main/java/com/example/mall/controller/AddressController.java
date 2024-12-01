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
public class AddressController {

    @Autowired
    private AddressService addressService;

    // 주소 검색 처리
    @PostMapping("/searchAddress")
    public String searchAddress(@RequestParam("searchAddress") String keyword, Model model) {
        List<Address> addressList = addressService.searchAddresses(keyword);
        model.addAttribute("addressList", addressList); // 검색 결과 전달
        return "signUp"; // 회원가입 페이지로 결과 포함하여 반환
    }
}
