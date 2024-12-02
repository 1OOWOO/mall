package com.example.mall.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.mall.service.GoodsService;
import com.example.mall.vo.Goods;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HelloController {
	@Autowired GoodsService goodsService;
	
	@GetMapping("/hello")
	public String hello(Model model) {
		List<Goods> goodsList = goodsService.getAllGoods();
		 Integer goodsCount = goodsService.getGoodsCount();
        model.addAttribute("goodsList", goodsList);
        model.addAttribute("goodsCount", goodsCount);
        
        log.debug("goodsList" + goodsList);
        log.debug("goodsCount: " + goodsCount);
        
		return "hello"; // /WEB-INF/view/hello.jsp 포워딩 역할
	}
}