package com.example.mall.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DashBoardMapper {
	// 신규 주문 수
	int selectNewOrders();

	// 취소된 주문 수
	int selectCanceledOrders();

	// 신규 후기 수
	int selectNewReviews();

	// 신규 회원 수
	int selectNewUsers();

	// 여러 데이터를 한 번에 반환 (선택적 사용)
	Map<String, Object> selectDashboardSummary();
}