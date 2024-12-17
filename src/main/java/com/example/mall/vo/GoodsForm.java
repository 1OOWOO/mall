package com.example.mall.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

//파일 리스트 추가를 위한 vo 추가

@Data
public class GoodsForm {
	private Integer goodsNo;
	private String goodsTitle;
	private String goodsMemo;
	private Integer goodsPrice;
	private String goodsState;
	private List<MultipartFile> goodsFile;
	private Integer goodsCategoryNo;
}
