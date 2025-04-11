package com.example.mall.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.mall.mapper.OrdersMapper;

@Service
@Transactional
public class OrdersService {
	@Autowired
	OrdersMapper ordersMapper;

	// 오자윤 : /admin/ordersList 전체 주문 카운트
	public int getOrdersListCount(Map<String, Object> map) {
		return ordersMapper.selectOrdersListCount(map);
	}
	
	// Author : 오아림
	// /admin/ordersList
	public List<Map<String, Object>> getOrdersList(Map<String, Object> map) {
		return ordersMapper.selectOrdersList(map);
	}

	// /admin/ordersList - 주문 수정
	public Integer modifyOrders(Map<String, Object> map) {
		return ordersMapper.updateOrders(map);
	}

}
