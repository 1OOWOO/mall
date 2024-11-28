package com.example.mall.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.mall.vo.Orders;

@Mapper
public interface OrdersMapper {
	// Author : 오아림
	// /admin/orderList
	List<Map<String,Object>> selectOrdersList(Map<String,Object> map);

	// /admin/orderList - 주문 수정
	Integer updateOrders(Map<String,Object> map);
}
