package com.example.mall.controller;

import com.example.mall.service.BoardService;
import com.example.mall.vo.Board;

import lombok.extern.slf4j.Slf4j;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.ui.Model;

@Slf4j
@Controller
public class BoardController {
	/* Author : 우정 */

	@Autowired
	private BoardService boardService;

	// Board 저장
	@PostMapping("/board/save")
	public String saveBoard(@RequestParam("boardContent") String boardContent, @RequestParam("ordersNo") int ordersNo,
			Model model) {
		// Board 객체 생성
		Board board = new Board();
		board.setBoardContent(boardContent);
		board.setOrdersNo(ordersNo);

		// Board 서비스로 저장
		boardService.saveBoard(board);

		// 성공 후 리다이렉트(리스트 페이지로 이동 등)
		return "redirect:/customer/myPage"; // MyPage로 리다이렉트
	}
}
