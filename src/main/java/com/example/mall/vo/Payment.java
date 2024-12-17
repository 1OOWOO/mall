package com.example.mall.vo;

import lombok.Data;

@Data
public class Payment {
	private Integer paymentNo;
	private Integer addressNo;
	private Integer paymentPrice;
	private String paymentMethod; // 페이, 카드
	private String paymentState; // 결제완료, 배송중, 배송완료
}