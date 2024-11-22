package com.example.mall.vo;

import lombok.Data;

@Data
public class Cart {
	private Integer cartNo; // pk
	private String customerMail; // fk
	private Integer goodsNo; // fk
	private Integer cartAmount;
	private String updateDate;
	private String createDate;
}
