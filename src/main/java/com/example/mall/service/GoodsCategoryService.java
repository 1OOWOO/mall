package com.example.mall.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.mall.mapper.GoodsCategoryMapper;
import com.example.mall.vo.Category;

//Author : 오아림
@Service
@Transactional
public class GoodsCategoryService {
	@Autowired
	private GoodsCategoryMapper goodsCategoryMapper;

	// 모든 카테고리 조회
	public List<Category> getAllCategory() {
		return goodsCategoryMapper.selectAllCategory();
	}

	// /admin/goodsOne - 상품 수정
	public Integer modifyGoodsCategory(Map<String, Object> map) {
		return goodsCategoryMapper.updateGoodsCategory(map);
	}

	// /customer/customerGoodsOne 특정 상품의 카테고리 조회
	public Category getCategoryByGoodsNo(Integer goodsNo) {
		return goodsCategoryMapper.selectCategoryByGoodsNo(goodsNo);
	}
}
