package com.example.mall.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.mall.mapper.CustomerMapper;
import com.example.mall.mapper.mapper;
import com.example.mall.vo.Customer;

import ch.qos.logback.core.model.Model;

@Service
public class CustomerService {
    @Autowired
    private CustomerMapper customerMapper;
    
	// 고객 상세정보 조회
	public Map<String, Object> selectCustomerOne(String customerMail) {
		return customerMapper.selectCustomerOne(customerMail);
	}

    
    // 고객 삭제 메서드.
    public boolean deleteCustomer(String customerId) {
    	return customerMapper.deleteCustomer(customerId) > 0; // 삭제된 행 수가 1이상이면 성공
    }
    
    // 전체 고객 가져오는 메서드.
    public List<Customer> getCustomerList() {
        return customerMapper.getCustomerList(); // 전체 고객 리스트 반환.
    } 
    
     // 특정 페이지의 고객 목록을 반환 (페이징 처리)
        public List<Customer> getCustomerListByPage(int page, int size) {
            List<Customer> allCustomers = getCustomerList(); // 전체 고객 목록을 가져옴
            int start = page * size; // 시작 인덱스
            int end = Math.min(start + size, allCustomers.size()); // 끝 인덱스

            if (start >= allCustomers.size()) {
                return List.of(); // 요청한 페이지가 존재하지 않는 경우 빈 리스트 반환
            }

            return allCustomers.subList(start, end); // 요청한 페이지의 고객 목록 반환
        }

        // 전체 고객 수를 가져오는 메서드
        public int getTotalCount(String email) {
            return customerMapper.getTotalCount(); // 전체 고객 수 반환
        }
        
        // 이메일로 고객 목록 검색 (페이징 처리) 
        public List<Customer> searchCustomerByEmail(String email, int page, int size) {
        	Map<String, Object> result= new HashMap<>();
        	result.put("email", email);
        	result.put("page", page);
        	result.put("size", size);
            return customerMapper.searchCustomerByEmail(result); // Mapper 호출
        }

        // 이메일 검색 시 전체 고객 수 가져오기
        public int getTotalCountByEmail(String email) {
            return customerMapper.getTotalCountByEmail(email); // Mapper 호출
        }
        
       // 이메일로 고객 정보 조회 (단일 고객)
            public Customer getCustomerByEmail(String email) {
                return customerMapper.getCustomerByEmail(email); // Mapper 호출하여 고객 반환
        }

		
    }

