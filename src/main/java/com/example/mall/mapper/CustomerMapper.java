package com.example.mall.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.mall.vo.Customer;

@Mapper
public interface CustomerMapper {
	// 전체 고객 리스트 반환
	List<Customer> getCustomerList();
	
	// 전체 고객 수 번환
	int getTotalCount(); 
	
    // 이메일로 고객 목록 검색 (페이징 처리)
    List<Customer> searchCustomerByEmail(@Param("email") String email, @Param("offset") int offset, @Param("limit") int limit);
    
    // 이메일 검색 시 전체 고객 수 반환
    int getTotalCountByEmail(@Param("email") String email);

}
