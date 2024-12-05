package com.example.mall.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.mall.service.CartService;
import com.example.mall.service.CustomerService;
import com.example.mall.service.PaymentService;
import com.example.mall.vo.Customer;
import com.example.mall.vo.Payment;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

import java.util.List;
import java.util.Map;
@Slf4j
@Controller
public class PaymentController {
    @Autowired PaymentService paymentService;
    @Autowired CustomerService customerService;
    @Autowired CartService cartService;
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
    @PostMapping("/customer/paymentList")
    public String paymentPage(HttpSession session, Model model, @RequestParam(value="goodsChoice", required = false) List<Integer> goodsChoice) {
    	// 로그인한 고객 정보 가져오기
    	Customer loginCustomer = (Customer) session.getAttribute("loginCustomer");
    	// 로그인하지 않은 경우, 로그인 페이지로 리다이렉트
    	if (loginCustomer == null) {
    		return "redirect:/customer/payment";
    	}
    	
    	// 고객 이메일 가져오기
    	String customerMail = ((Customer)session.getAttribute("loginCustomer")).getCustomerMail();
    	// 고객 주소리스트 가져오기
    	Map<String, Object> customer = customerService.selectCustomerOne(customerMail);
    	model.addAttribute("customer",customer);
    	// 고객 장바구니리스트 가져오기
    	List<Map<String, Object>> cartList = cartService.getCartItem(customerMail);
    	model.addAttribute("cartList",cartList);
    	// 총 결제가격 계산
    	Long totalPrice = 0L;
    	for (Map<String, Object> cart : cartList) {
    		totalPrice += (Long)cart.get("goodsTotalPrice");
    	}
    	model.addAttribute("totalPrice",totalPrice);
    	// 장바구니에 담긴 항목 수 계산
    	List<Map<String,Object>> cart = cartService.getCartItem(customerMail);
    	model.addAttribute("countCartList", cart.get(0).get("countCartList"));
        return "customer/paymentList"; // 결제 페이지 JSP 파일 이름
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