package com.example.mall.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.mall.vo.Customer;

@Mapper
public interface CustomerMapper {
	// 오자윤 : 이메일로 고객 정보 검색
	Customer searchByEmail(String customerMail);

	// 우정 : 회원가입
	void insertCustomer(Customer customer);

	// 우정 : 로그인
	Customer login(Customer customer);

	// 오자윤 : 고객 상세정보 조회
	Map<String, Object> selectCustomerOne(String customerMail);

	// 오자윤 : 고객 이메일로 고객 정보 조회
	Customer getCustomerByEmail(String customerMail);

	// 오자윤 : 고객 삭제 메서드
	Integer deleteCustomer(String customerMail);

	// 오자윤 : 전체 고객 리스트 반환
	List<Map<String, Object>> selectCustomerList(Map<String, Object> param);

	// 오자윤 : 전체 고객 수 번환
	Integer getTotalCount();

	// 오자윤 : 고객리스트 카운트
	Integer countCustomerList();

}