package com.example.mall.vo;

import lombok.Data;

@Data
public class Customer {
	private String customerMail; // pk
	private String customerPw;
	private String birth;
	private String gender;
	private String updateDate;
	private String createDate;
}
