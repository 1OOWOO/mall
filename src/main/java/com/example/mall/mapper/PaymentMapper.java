package com.example.mall.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.mall.vo.Payment;

@Mapper
public interface PaymentMapper {
    // Author : 오자윤
	
	// 결제 완료
	Integer insertPayment(Payment payment);
	
	// 결제 완료창
	List<Map<String, Object>> completePayment(Integer paymentNo); 
	
    // 특정 고객의 결제 정보 조회
    Map<String, Object> selectPaymentByCustomerMail(String customerMail);
    
    // 결제 수단 조회
    List<Map<String, Object>> selectPaymentMethods(String customerMail);
    
    // 결제 완료 상태 업데이트
    Integer updatePaymentStatus(Map<String, Object> updateDetails);
}
