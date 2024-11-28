package com.example.mall.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.mall.vo.Customer;

@Mapper
public interface CustomerMapper {
	
	// 고객 상세정보 조회
	Map<String, Object> selectCustomerOne(String customerMail);
	
	// 고객 이메일로 고객 정보 조회
    Customer getCustomerByEmail(String email); 
    
	// 고객 삭제 메서드
	int deleteCustomer(String customerId);

	// 전체 고객 리스트 반환
	List<Customer> getCustomerList();
	
	// 전체 고객 수 번환
	int getTotalCount(); 
	
    // 이메일로 고객 목록 검색 (페이징 처리)
    List<Customer> searchCustomerByEmail(Map<String, Object> result);
    
    // 이메일 검색 시 전체 고객 수 반환
    int getTotalCountByEmail(@Param("email") String email);


}