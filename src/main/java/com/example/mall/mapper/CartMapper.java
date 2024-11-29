package com.example.mall.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.mall.vo.Cart;

@Mapper
public interface CartMapper {
	Integer addToCart(Cart cart);
}
