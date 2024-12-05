package com.example.mall.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.mall.vo.Board;

@Mapper
public interface BoardMapper {

    // 우정 : Board 저장
    void insertBoard(Board board);
    
    // 우정 : 모든 Board 리스트 가져오기
    List<Map<String, Object>> selectAllBoards(int goodsNo);

}
