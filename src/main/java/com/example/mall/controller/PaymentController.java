package com.example.mall.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.mall.service.AddressService;
import com.example.mall.service.CartService;
import com.example.mall.service.CustomerService;
import com.example.mall.service.PaymentService;
import com.example.mall.vo.Address;
import com.example.mall.vo.Customer;
import com.example.mall.vo.Payment;

import jakarta.servlet.http.HttpSession;
import lombok.With;
import lombok.extern.slf4j.Slf4j;

import java.util.List;
import java.util.Map;
@Slf4j
@Controller
public class PaymentController {
    @Autowired PaymentService paymentService;
    @Autowired CustomerService customerService;
    @Autowired CartService cartService;
    @Autowired AddressService addressService;
    //Author : 오자윤
   
    @GetMapping("/customer/completePayment")
    public String completePayment(@RequestParam Integer paymentNo, Model model) {
    	// 오더리스트 가져오기
    	List<Map<String, Object>> orderList = paymentService.completePayment(paymentNo);
    	model.addAttribute("orderList", orderList);
    	return "customer/payment";
    }
    
    @PostMapping("/customer/addPayment")
    public String addPayment(Payment payment, @RequestParam(value="cartNo", required=false) List<Integer> cartNo) {
    	log.debug("cartNo------>", cartNo);
    	log.debug("payment------>", payment);
    	Integer paymentNo = paymentService.addPayment(payment, cartNo);
    	return "redirect:/customer/completePayment?paymentNo=" + paymentNo;
    }
    
    // 결제 페이지 호출
    @GetMapping("/customer/paymentList")
    public String paymentPage(HttpSession session, Model model) {
    	// 로그인한 고객 정보 가져오기
    	Customer loginCustomer = (Customer) session.getAttribute("loggedInCustomer");
	    // 주소 리스트 가져오기
    	List<Address> addressList = addressService.AddressListByCustomerMail(loginCustomer.getCustomerMail());
	    model.addAttribute("addressList", addressList);
    	// 고객 이메일 가져오기
    	String customerMail = loginCustomer.getCustomerMail();
    	model.addAttribute("customerMail", customerMail);
    	// 고객 장바구니리스트 가져오기
    	List<Map<String, Object>> cartList = cartService.getCartItem(customerMail);
    	model.addAttribute("cartList",cartList);
    	return "customer/payment"; // 결제 페이지 JSP 파일 이름
    }
    
    @GetMapping("/customer/payment")
    public String paymentList(Model model) {
    	return "customer/payment";
    }
    
    // 고객의 결제 정보 조회
    @GetMapping("/admin/paymentInfo")
    public String paymentInfo(@RequestParam String customerMail, Model model) {
        Map<String, Object> paymentInfo = paymentService.getPaymentInfo(customerMail);
        model.addAttribute("paymentInfo", paymentInfo);
        return "admin/paymentInfo"; 
    }
}