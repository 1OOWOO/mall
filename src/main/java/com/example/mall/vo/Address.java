package com.example.mall.vo;

import lombok.Data;

@Data
public class Address {
	private Integer addressNo; // pk
	private String customerMail; // fk
	private String addressDetail;
	private String updateDate;
	private String createDate;
}
