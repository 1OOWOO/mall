package com.example.mall.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.mall.vo.Category;
import com.example.mall.vo.GoodsCategory;

@Mapper
public interface GoodsCategoryMapper {
	// Author : 오아림
	// /admin/addGoods
	Integer insertGoodsCategory(Map<String, Object> map);

	// 모든 카테고리 조회 - /admin/goodsOne
	List<Category> selectAllCategory();

	// /admin/goodsOne - 상품 수정
	Integer updateGoodsCategory(Map<String, Object> map);

	// /customer/customerGoodsOne 특정 상품의 카테고리 조회
	Category selectCategoryByGoodsNo(Integer goodsNo);
}
