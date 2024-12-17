package com.example.mall.vo;

import lombok.Data;

@Data
public class Address {
	private Integer addressNo; // primary key
	private String customerMail; // foreign key
	private String addressDetail;
	private String updateDate;
	private String createDate;
}
