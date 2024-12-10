package com.example.mall.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.mall.mapper.CartMapper;
import com.example.mall.mapper.OrdersMapper;
import com.example.mall.mapper.PaymentMapper;
import com.example.mall.vo.Orders;
import com.example.mall.vo.Payment;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class PaymentService {
	@Autowired PaymentMapper paymentMapper;
	@Autowired CartMapper cartMapper;
	@Autowired OrdersMapper ordersMapper;
	
	// 오자윤 : 결제 완료 시 orders payment 생성, cart 삭제
	public Integer addPayment(Payment payment, List<Integer> cartNo, Integer addressNo) {
		payment.setAddressNo(addressNo);
		Integer paymentRow = paymentMapper.insertPayment(payment);
		Integer paymentNo = payment.getPaymentNo();
		if(paymentRow == 1) {
				Integer count = 0;
				for(Integer c : cartNo) {
					// 장바구니에서 선택된 항목들의 정보를 가져와서 Order 객체에 저장
					Map<String, Object> cart = cartMapper.selectedCart(c);
					Orders orders = new Orders();
					orders.setGoodsNo((Integer)cart.get("goodsNo"));
					orders.setOrdersAmount((Integer)cart.get("cartAmount"));
					orders.setPaymentNo(paymentNo);
					// orders 테이블에 결제 정보 추가
					count += ordersMapper.insertOrders(orders);
				}
				if(count == cartNo.size()) {
					count = 0;
					for(Integer c : cartNo) {
						count += cartMapper.removeCart(c);
					}
				}
		}
		return paymentNo;
	}
	
	
	// 오자윤 : 고객 이메일로 결제 정보 조회	
	public Map<String, Object> getPaymentInfo(String customerMail) {
		return paymentMapper.selectPaymentByCustomerMail(customerMail);
    }
	
	// 오자윤 : 결제 완료 상태 업데이트
	public List<Map<String, Object>> completePayment(Integer paymentNo) {
		return paymentMapper.completePayment(paymentNo);
	}
}
