package com.example.mall.vo;

import lombok.Data;

@Data
public class Category {
	private Integer categoryNo; // pk
	private String categoryTitle;
	private String updateDate;
	private String createDate;
}
