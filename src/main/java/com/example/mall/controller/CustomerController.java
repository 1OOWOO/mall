package com.example.mall.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.mall.service.CustomerService;
import com.example.mall.util.Page;
import com.example.mall.vo.Customer;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Controller
public class CustomerController {
    @Autowired
    private CustomerService customerService;

    // 오자윤 : 회원정보
    @GetMapping("/admin/customerList")
    public String customerList(HttpSession session, Model model, @RequestParam(defaultValue = "1") Integer currentPage, @RequestParam(defaultValue = "10") Integer rowPerPage) {
        
    	Page page = new Page();
    	page.setCurrentPage(currentPage);
    	page.setRowPerPage(rowPerPage);
    	page.setNumPerPage(10);
    	page.setCountTotalRow(customerService.countCustomerList());
    	
        model.addAttribute("currentPage", page.getCurrentPage());
        model.addAttribute("lastPage", page.countLastPage());
        model.addAttribute("beginPageNum", page.countBeginPageNum());
        model.addAttribute("endPageNum", page.countEndPageNum()); // 검색한 이메일 유지
        model.addAttribute("numPerPage", page.getNumPerPage()); // 페이지 크기 추가
        
        // 고객 리스트 출력
        List<Map<String, Object>> customerList = customerService.getCustomerList(currentPage, rowPerPage, page.countBeginRow());
        model.addAttribute("customerList", customerList);
        model.addAttribute("currentPage", currentPage);
        return "admin/customerList"; 
    }
    
    // 오자윤 : admin/customerList 고객이메일 검색, AJAX 요청
    @GetMapping("/admin/customerList/search")
    @ResponseBody // HTTP 응답 본문을 JSON 형식으로 구성.
    public ResponseEntity<Map<String, Object>> searchCustomerList(@RequestParam(value="searchEmail", required = false) String customerMail) {
        log.debug("customerMail 검색창----->" + customerMail); // 고객이 검색한 이메일 정보
        List<Customer> customerList = new ArrayList<>(); // 고객 리스트 초기화
        if (customerMail != null && !customerMail.isEmpty()) {
            Customer customer = customerService.searchByEmail(customerMail);
            if (customer != null) {
                customerList.add(customer); // 검색 결과 있을 경우 리스트에 추가
            }
        }
        
        Map<String, Object> response = new HashMap<>();
        response.put("customerList", customerList); // JSON 응답에 고객 리스트 추가
        return ResponseEntity.ok(response); // JSON 응답 반환
    }

    
    // 우정 : 회원가입 처리 (signup 페이지에서 직접 처리)
    @PostMapping("/signup")
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
            return "signup"; // 오류 시 회원가입 페이지로 돌아가기
        }
    }

    // 개별 회원
    @GetMapping("/admin/customerOne")
    public String customerOne(Model model, @RequestParam String customerMail) {
    	 log.debug(customerMail + "-----> customerMail"); 
        Map<String, Object> customer = customerService.selectCustomerOne(customerMail);
        model.addAttribute("customer", customer);
        return "admin/customerOne";
    }

    // 회원삭제
    @GetMapping("/admin/deleteCustomer")
    // 현재 페이지 초기화
    public String deleteCustomer(String customerMail, @RequestParam(required = false, defaultValue = "1") Integer currentPage) {
    	log.debug(customerMail + "<---- customer 이메일");
    	customerService.deleteCustomer(customerMail);
        log.debug(currentPage +"<---- 현재페이지");
        
         return "redirect:/admin/customerList?currentPage=" + currentPage;
        }
}
