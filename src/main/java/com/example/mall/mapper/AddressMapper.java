package com.example.mall.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.mall.vo.Address;

@Mapper
public interface AddressMapper {
   List<Address> selectAddressList(String searchAddress);
}