package com.example.mall.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.mall.service.CustomerService;
import com.example.mall.vo.Customer;

import java.util.List;

@Controller
public class CustomerController {
    @Autowired
    private CustomerService customerService;

    @GetMapping("/admin/customerList")
    public String customerList( 
    	// 페이징 작업
    	@RequestParam(defaultValue = "0") int page,
    	@RequestParam(defaultValue = "10") int size,
    	Model model) {
    	
    	// 요청한 페이지의 고객목록
        List<Customer> customerList = customerService.getCustomerListByPage(page, size);
        
        // 전체 고객 수.
        int totalCount = customerService.getTotalCount();
        // 전체 페이지 수
        int totalPages = (int) Math.ceil((double) totalCount / size);

        model.addAttribute("customers", customerList);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        return "admin/customerList"; // JSP 파일 이름
    }
}