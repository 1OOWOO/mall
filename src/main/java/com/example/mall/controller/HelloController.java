package com.example.mall.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.mall.service.GoodsFileService;
import com.example.mall.service.GoodsService;
import com.example.mall.vo.Goods;
import com.example.mall.vo.GoodsFile;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HelloController {
	@Autowired GoodsService goodsService;
	@Autowired GoodsFileService goodsFileService;
	
	@GetMapping("/hello")
	public String hello(Model model) {
		List<Goods> goodsList = goodsService.getAllGoods();
		 Integer goodsCount = goodsService.getGoodsCount();
        model.addAttribute("goodsList", goodsList);
        model.addAttribute("goodsCount", goodsCount);
        
        Map<Integer, List<GoodsFile>> goodsFileMap = new HashMap<>();

        for (Goods goods : goodsList) {
            List<GoodsFile> goodsFileList = goodsFileService.getGoodsFileListByNo(goods.getGoodsNo());
            goodsFileMap.put(goods.getGoodsNo(), goodsFileList);
        }
        model.addAttribute("goodsFileMap", goodsFileMap); // Map을 모델에 추가
        
		/*
		 * log.debug("goodsList" + goodsList); log.debug("goodsCount: " + goodsCount);
		 */
        
		return "hello"; // /WEB-INF/view/hello.jsp 포워딩 역할
	}
}