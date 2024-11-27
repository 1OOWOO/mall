package com.example.mall.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.mall.vo.Address;

import java.util.List;

@Mapper
public interface AddressMapper {
    List<Address> searchAddresses(@Param("keyword") String keyword);
}
