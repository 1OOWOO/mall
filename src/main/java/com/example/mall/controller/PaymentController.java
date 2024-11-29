package com.example.mall.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.example.mall.service.PaymentService;
import lombok.extern.slf4j.Slf4j;
import java.util.Map;
@Slf4j
@Controller
public class PaymentController {
    
    @Autowired
    private PaymentService paymentService;
    // 결제 정보 입력 페이지
    @GetMapping("/admin/payment")
    public String paymentPage(Model model) {
        return "admin/payment"; // 결제 페이지 JSP 파일 이름
    }
    // 결제 처리
    @PostMapping("/processPayment")
    public String processPayment(
            @RequestParam String customerMail,
            @RequestParam String paymentMethod,
            @RequestParam Map<String, Object> paymentDetails, // 결제 세부 정보
            Model model) {
        
        // 결제 정보 저장
        paymentService.processPayment(paymentDetails);
        // 결제 완료 메시지
        model.addAttribute("message", "결제가 완료되었습니다.");
        return "redirect:/"; // 결제 완료 후 이동할 페이지
    }
    // 고객의 결제 정보 조회
    @GetMapping("/admin/paymentInfo")
    public String paymentInfo(@RequestParam String customerMail, Model model) {
        Map<String, Object> paymentInfo = paymentService.getPaymentInfo(customerMail);
        model.addAttribute("paymentInfo", paymentInfo);
        return "admin/paymentInfo"; 
    }
}