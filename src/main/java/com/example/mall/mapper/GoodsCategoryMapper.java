package com.example.mall.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.mall.vo.Category;
import com.example.mall.vo.GoodsCategory;
//Author : 오아림
@Mapper
public interface GoodsCategoryMapper {
	// /admin/addGoods
	Integer insertGoodsCategory(Integer goodsNo, Integer categoryNo);
	
	// 모든 카테고리 조회 - /admin/goodsOne
	List<Category> selectAllCategory(); 
	
	// /admin/goodsOne - 상품 수정
	Integer updateGoodsCategory(Map<String,Object> map);
}
