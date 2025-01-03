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
	@Autowired
	PaymentMapper paymentMapper;
	@Autowired
	CartMapper cartMapper;
	@Autowired
	OrdersMapper ordersMapper;

	// 오자윤 : 결제 완료 시 orders payment 생성, cart 삭제
	public Integer addPayment(Payment payment, List<Integer> cartNo, Integer addressNo) {
		payment.setAddressNo(addressNo);
		// 결제 정보를 payment 테이블에 삽입 후 paymentNo 가져오기
		Integer paymentRow = paymentMapper.insertPayment(payment);
		Integer paymentNo = payment.getPaymentNo();
		if (paymentRow == 1) { // 결제가 성공적으로 완료된 경우
			log.debug("결제성공" + paymentRow);
			Integer count = 0;
			log.debug("cartNo" + cartNo.toString());
			for (Integer c : cartNo) {
				// 장바구니에서 선택된 항목들의 정보를 가져와서 Order 객체에 저장
				Map<String, Object> cart = cartMapper.selectedCart(c);
				log.debug("cart" + cart.toString());
				Orders orders = new Orders();
				orders.setGoodsNo((Integer) cart.get("goodsNo"));
				orders.setOrdersAmount((Integer) cart.get("cartAmount"));
				orders.setPaymentNo(paymentNo);
				log.debug("orders" + orders.toString());
				// count += ordersMapper.insertOrders(orders);
				// orders 테이블에 결제 정보 추가
				count += ordersMapper.insertOrders(orders);
				log.debug("count------->" + count);
			}
			if (count == cartNo.size()) { // 주문 성공적으로 생성시, 장바구니 항목 삭제
				log.debug("카드삭제 성공" + count);
				count = 0;
				for (Integer c : cartNo) {
					log.debug("Removng cartNo as c--------->" + c);
					count += cartMapper.removeCart(c);
					log.debug("rowmoveRow--------->" + count);
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
