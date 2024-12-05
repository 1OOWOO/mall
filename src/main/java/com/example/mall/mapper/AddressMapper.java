package com.example.mall.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.mall.vo.Address;

import java.util.List;
import java.util.Map;

@Mapper
public interface AddressMapper {
	
	// 고객 주소 가져오기
	List<Address> addressListByCustomerMail(String customerMail);
	
    List<Address> searchAddresses(@Param("keyword") String keyword);
    Integer insertAddress(Map<String, Object> param);
}
