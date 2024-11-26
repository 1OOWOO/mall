package com.example.mall.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.mall.vo.Customer;

@Mapper
public interface CustomerMapper {
	// 전체 고객 리스트 반환
	List<Customer> getCustomerList();
	
	// 전체 고객 수 번환
	int getTotalCount(); 
}
