package com.example.mall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.mall.mapper.AddressMapper;
import com.example.mall.vo.Address;

import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class AddressService {
   @Autowired AddressMapper addressMapper;
   
   public List<Address> getAddressList(String searchAddress){
      return addressMapper.selectAddressList(searchAddress);
   }
}
