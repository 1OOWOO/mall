package com.example.mall.service;

import com.example.mall.vo.Board;
import com.example.mall.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardService {

    @Autowired
    private BoardMapper boardMapper;

    // Board 저장
    public void saveBoard(Board board) {
        boardMapper.insertBoard(board);
    }
}
