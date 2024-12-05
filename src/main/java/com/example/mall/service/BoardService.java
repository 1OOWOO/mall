package com.example.mall.service;

import com.example.mall.vo.Board;
import com.example.mall.mapper.BoardMapper;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardService {
	/* Author : 우정 */
	
    @Autowired
    private BoardMapper boardMapper;

    // Board 저장
    public void saveBoard(Board board) {
        boardMapper.insertBoard(board);
    }
    
 // Board 리스트 가져오기
    public List<Map<String, Object>> getBoardList(int goodsNo) {
        return boardMapper.selectAllBoards(goodsNo);
    }
}
