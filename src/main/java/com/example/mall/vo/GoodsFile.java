package com.example.mall.vo;

import lombok.Data;

@Data
public class GoodsFile {
	private Integer goodsFileNo; // pk
	private Integer goodsNo;
	private String goodsFileName;
	private String goodsFileOrigin;
	private String goodsFileExt;
	private String goodsFileType;
	private String goodsFileSize;
	private String updateDate;
	private String createDate;
}