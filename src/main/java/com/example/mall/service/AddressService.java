package com.example.mall.service;

import com.example.mall.mapper.AddressMapper;
import com.example.mall.vo.Address;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class AddressService {

    @Autowired
    private AddressMapper addressMapper;

    // 주소 검색 로직
    public List<Address> searchAddresses(String keyword) {
        return addressMapper.searchAddresses(keyword);
    }
    
    public Integer insertAddress(Map<String, Object> param) {
    	return addressMapper.insertAddress(param);
    }
}
