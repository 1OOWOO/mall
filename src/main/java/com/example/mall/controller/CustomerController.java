package com.example.mall.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.mall.service.CustomerService;
import com.example.mall.vo.Customer;

import lombok.extern.slf4j.Slf4j;

import java.util.List;
import java.util.Map;

@Slf4j
@Controller
public class CustomerController {
    @Autowired
    private CustomerService customerService;
    
    // 우정 : 회원가입 처리 (signup 페이지에서 직접 처리)
    @PostMapping("/signup")
    public String register(Customer customer, Model model) {
        try {
            // 이메일 중복 확인
//            if (customerService.checkEmailExists(customer.getCustomerMail())) {
//                model.addAttribute("message", "이미 사용 중인 이메일입니다.");
//                return "signup"; // 회원가입 페이지로 돌아가기
//            }

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
    public String customerOne(Model model, String customerMail) {
    	Map<String, Object> customer=customerService.selectCustomerOne(customerMail);
    	model.addAttribute("customer", customer);
    
    	return "admin/customerOne";
    	
    }
    
    // 회원삭제
    @PostMapping("/admin/deleteCustomer")
    public String deleteCustomer(String customerMail, Model model  ) {
    	int success = customerService.deleteCustomer(customerMail);
    	
    	if (success == 0) {
    		model.addAttribute("error", "회원 강퇴에 실패했습니다.");
    		return "redirect:/admin/customerList";
        } else {
        	model.addAttribute("message", "회원이 성공적으로 강퇴되었습니다.");
        	return "redirect:/admin/customerOne?customerMail="+customerMail;
        }

    }
    
    @GetMapping("/admin/customerList")
    public String customerList( 
    	// 페이징 작업
    	@RequestParam(defaultValue = "1") int page,	// 페이지 초기값
    	@RequestParam(defaultValue = "10") int size, // 10페이지 씩
    	@RequestParam(required = false) String searchEmail, // 이메일 검색
        Model model) {
    	
    	if (searchEmail != null && !searchEmail.isEmpty()) {
            // 검색을 위해, 0으로 페이지 리셋.
            page = 0;
        }

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