package com.example.mall.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.mall.mapper.PaymentMapper;

@Service
public class PaymentService {
	@Autowired
	private PaymentMapper paymentMapper;

    public void processPayment(Map<String, Object> paymentDetails) {
   
    	// 결제 정보 저장
    paymentMapper.insertPayment(paymentDetails);
    }

    public Map<String, Object> getPaymentInfo(String customerMail) {
        return paymentMapper.selectPaymentByCustomerMail(customerMail);
    }

    public List<Map<String, Object>> getPaymentMethods(String customerMail) {
        return paymentMapper.selectPaymentMethods(customerMail);
    }

    public void completePayment(Map<String, Object> updateDetails) {
        paymentMapper.updatePaymentStatus(updateDetails);
    }
}