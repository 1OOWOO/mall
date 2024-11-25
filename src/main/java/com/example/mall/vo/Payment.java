package com.example.mall.vo;

import lombok.Data;

@Data
public class Payment {
	private Integer paymentNo; // pk
	private Integer addressNo;
	private Integer paymentPrice;
	private String paymentMethod; 
	private String paymentState;
}