package com.example.mall.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.mall.vo.Board;

@Mapper
public interface BoardMapper {

    // 우정 : Board 저장
    void insertBoard(Board board);
}
