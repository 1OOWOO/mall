package com.example.mall.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.mall.service.CustomerService;
import com.example.mall.vo.Customer;

import lombok.extern.slf4j.Slf4j;

import java.util.List;

@Slf4j
@Controller
public class CustomerController {
    @Autowired
    private CustomerService customerService;
    
    @GetMapping("/admin/customerList")
    public String customerList( 
    	// 페이징 작업
    	@RequestParam(defaultValue = "0") int page,	// 페이지 초기값
    	@RequestParam(defaultValue = "10") int size, // 10페이지 씩
    	@RequestParam(required = false) String searchEmail, // 이메일 검색
        Model model) {
    	
    	log.debug("customerList 메서드 호출. page: {}, size: {}, email: {}", page, size, searchEmail);
    	// 요청한 페이지의 고객목록
        List<Customer> customerList;
        
        if (searchEmail != null && !searchEmail.isEmpty()) {
            // 이메일 검색 시
            customerList = customerService.searchCustomerByEmail(searchEmail, page, size);
            log.debug("이메일로 검색된 고객 수 : {}", customerList.size());
        } else {
            // 요청한 페이지의 고객 목록
            customerList = customerService.getCustomerListByPage(page, size);
            log.debug("전체 고객 수 : {}", customerList.size());
        }
        
        // 전체 고객 수.
        int totalCount = customerService.getTotalCount(searchEmail); // 이메일 검색 시 전체 수 조정
        log.debug("전체 고객 수 : {}", totalCount);
        // 전체 페이지 수
        int totalPages = (int) Math.ceil((double) totalCount / size);
        log.debug("전체 페이지 수 : {}", totalPages);

        model.addAttribute("customers", customerList);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("searchEmail", searchEmail); // 검색한 이메일 유지
        model.addAttribute("size", size); // 페이지 크기 추가
        return "admin/customerList"; // JSP 파일 이름
    }
    
    
}