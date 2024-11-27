package com.example.mall.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.mall.service.AddressService;
import com.example.mall.vo.Address;

@Controller
public class SignUpController {
   @GetMapping("/signUp") // doGet() 역활
   public String signUp() {
      return "signUp"; // /WEB-INF/view/hello.jsp 포워딩 역활
      
   }
   
//   @GetMapping("/on/searchAddress")
//   @ResponseBody
//   public List<Address> searchAddress(@RequestParam String searchAddress) {
//       return AddressService.searchAddress(searchAddress); // 주소 서비스 메서드 호출
//   }

       
}

