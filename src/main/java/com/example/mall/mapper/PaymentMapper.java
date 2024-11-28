package com.example.mall.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PaymentMapper {
	    
	    // 결제 정보 저장
	    Integer insertPayment(Map<String, Object> paymentDetails);
	    
	    // 결제 정보 조회 (특정 고객의 결제 정보)
	    Map<String, Object> selectPaymentByCustomerMail(String customerMail);
	    
	    // 결제 수단 조회
	    List<Map<String, Object>> selectPaymentMethods(String customerMail);
	    
	    // 결제 완료 상태 업데이트
	    Integer updatePaymentStatus(Map<String, Object> updateDetails);
	}