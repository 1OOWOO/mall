package com.example.mall.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.mall.mapper.PaymentMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class PaymentService {
	@Autowired private PaymentMapper paymentMapper;
	
	// 결제 정보 저장
	public void processPayment(Map<String, Object> paymentDetails)  {
		paymentMapper.insertPayment(paymentDetails);
    }
	
	// 고객 이메일로 결제 정보 조회	
	public Map<String, Object> getPaymentInfo(String customerMail) {
		return paymentMapper.selectPaymentByCustomerMail(customerMail);
    }
	
	// 결제 완료 상태 업데이트
	public void completePayment(Map<String, Object> updateDetails) {
		paymentMapper.updatePaymentStatus(updateDetails);
	}
}
