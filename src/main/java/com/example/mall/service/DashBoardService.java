package com.example.mall.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.batch.BatchTransactionManager;
import org.springframework.stereotype.Service;

import com.example.mall.mapper.DashBoardMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class DashBoardService {
	@Autowired
	private DashBoardMapper dashboardMapper;

	public int getNewOrders() {
		return dashboardMapper.selectNewOrders();
	}

	public int getCanceledOrders() {
		return dashboardMapper.selectCanceledOrders();
	}

	public int getNewReviews() {
		return dashboardMapper.selectNewReviews();
	}

	public int getNewUsers() {
		return dashboardMapper.selectNewUsers();
	}

	public Map<String, Object> getDashboardSummary() {
		return dashboardMapper.selectDashboardSummary();
	}
}
