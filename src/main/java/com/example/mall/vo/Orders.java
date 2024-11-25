package com.example.mall.vo;

import lombok.Data;

@Data
public class Orders {
	private Integer ordersNo;
	private Integer goodsNo;
	private Integer ordersAmount;
	private Integer paymentNo;
	private String updateDate;
	private String createDate;
}
