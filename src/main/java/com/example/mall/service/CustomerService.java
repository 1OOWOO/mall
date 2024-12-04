package com.example.mall.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.mall.mapper.CustomerMapper;
import com.example.mall.vo.Customer;

import ch.qos.logback.core.model.Model;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class CustomerService {
    @Autowired
    private CustomerMapper customerMapper;
    
    // 우정 : 고객 로그인
    public Customer login(Customer paramCustomer) {
		return customerMapper.login(paramCustomer);
		
	}
	 // 이메일 중복 확인 --> 필요 시 활성화
	//  public boolean checkEmailExists(String email) {
	//      // 이메일로 검색해서 고객이 있으면 true 반환, 없으면 false 반환
	//      int count = customerMapper.getTotalCountByEmail(email);
	//      return count > 0; // 이미 존재하면 true, 아니면 false
	//  }
    
    // 우정 : 회원가입 처리
    public void registerCustomer(Customer customer) {
        customerMapper.insertCustomer(customer); // DB에 저장
    }
    
    
	// 오자윤 : 고객 상세정보 조회
	public List<Map<String, Object>> selectCustomerOne(String customerMail) {
		return customerMapper.selectCustomerOne(customerMail);
	}

    
    // 오자윤 : 고객 삭제 메서드.
    public Integer deleteCustomer(String customerMail) {
    	return customerMapper.deleteCustomer(customerMail); 
    }
    
     // 오자윤 : 고객 리스트 가져오기.
        public List<Map<String, Object>> getCustomerList(Integer currentPage, Integer rowPerPage, Integer beginRow) {
        	// 고객 리스트 페이징 처리
        	Map<String, Object> param = new HashMap<>();
        	param.put("beginRow", beginRow);
        	param.put("rowPerPage", rowPerPage);
        	return customerMapper.selectCustomerList(param);
        }

        // 오자윤 : 전체 고객 수 가져오는 메서드
        public Integer getTotalCount(String customerMail) {
            return customerMapper.getTotalCount(); // 전체 고객 수 반환
        }
        
        // 오자윤 : 이메일로 고객 목록 검색 (페이징 처리) 
        public Integer countCustomerList() {
        	return customerMapper.countCustomerList(); // Mapper 호출
        }

        // 오자윤 : 이메일 검색 시 전체 고객 수 가져오기
        public Integer getTotalCountByEmail(String customerMail) {
            return customerMapper.getTotalCountByEmail(customerMail); // Mapper 호출
        }
        
       // 오자윤 : 이메일로 고객 정보 조회 (단일 고객)
            public Customer getCustomerByEmail(String customerMail) {
                return customerMapper.getCustomerByEmail(customerMail); // Mapper 호출하여 고객 반환
        }

		
    }