package com.example.mall.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.mall.vo.Orders;

@Mapper
public interface OrdersMapper {
	// Author : 오아림

	// 오자윤 : 결제 완료시 주문내역 추가
	Integer insertOrders(Orders orders);

	// 오자윤 : /admin/orderList 전체 주문 카운트
	int selectOrdersListCount(Map<String, Object> map);
	
	// /admin/orderList
	List<Map<String, Object>> selectOrdersList(Map<String, Object> map);

	// /admin/orderList - 주문 수정
	Integer updateOrders(Map<String, Object> map);
}
