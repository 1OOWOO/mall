package com.example.mall.vo;

import lombok.Data;

@Data
public class Goods {
	private Integer goodsNo;
	private String goodsTitle;
	private String goodsMemo;
	private Integer goodsPrice;
	private String goodsState;
	private String updateDate;
	private String createDate;
}
