package com.example.mall.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.mall.vo.Category;
//Author : 오아림
@Mapper
public interface GoodsCategoryMapper {
	
	// 모든 카테고리 조회 - /admin/goodsOne
	List<Category> selectAllCategory(); 
}
