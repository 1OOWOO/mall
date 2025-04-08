package com.example.mall.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.mall.vo.Goods;
import com.example.mall.vo.GoodsFile;

@Mapper
public interface GoodsMapper {
	
	// Author : 오자윤
	// /hello 상품분류
    List<Goods> sortGoods(Map<String, Object> params);
	
	// 상품 정보 가져오기-> 장바구니
	Map<String, Object> getGoodsById(String goodsNo);

	// Author : 오아림
	// /admin/addGoods
	Integer insertGoods(Goods goods);

	// /admin/goodsList
	List<Map<String, Object>> selectGoodsList(Map<String, Object> map);

	// goodsList 페이징
	Integer selectGoodsCount();

	// /admin/goodsOne
	Map<String, Object> selectGoodsOne(Integer goodsNo);

	// /admin/goodsOne - 상품 수정
	Integer updateGoods(Map<String, Object> map);

	// /customer/customerGoodsOne
	Goods selectCustomerGoodsOne(Integer goodsNo);

	// /hello
	List<Goods> selectAllGoods();

	// /customer/searchGoods
	List<Map<String, Object>> selectGoodsByCategory(Integer categoryNo);

	// /customer/searchGoods - 카테고리 검색 결과 개수
	Integer countGoodsByCategory(Integer categoryNo);
}