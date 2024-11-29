package com.example.mall.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.mall.vo.Goods;
import com.example.mall.vo.GoodsFile;

@Mapper
public interface GoodsMapper {
// Author : 오아림
	// /admin/addGoods
	Integer insertGoods(Goods goods);
	
	// /admin/goodsList
	List<Map<String,Object>> selectGoodsList(Map<String,Object> map);
	
	// goodsList 페이징
	Integer selectGoodsCount();
	
	// /admin/goodsOne
	Map<String,Object> selectGoodsOne(Integer goodsNo);
	
	// /admin/goodsOne - 상품 수정
	Integer updateGoods(Map<String,Object> map);
	
	// /customer/customerGoodsOne
	Goods selectCustomerGoodsOne(Integer goodsNo);
	
	// /hello
	List<Goods> selectAllGoods();
}
