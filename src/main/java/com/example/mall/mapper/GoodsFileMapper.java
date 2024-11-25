package com.example.mall.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.mall.vo.GoodsFile;

@Mapper
public interface GoodsFileMapper {
	// /admin/addGoodsFile
	Integer insertGoodsFile(GoodsFile goodsFile);
}
