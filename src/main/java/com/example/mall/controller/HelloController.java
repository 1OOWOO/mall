package com.example.mall.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.mall.service.GoodsFileService;
import com.example.mall.service.GoodsService;
import com.example.mall.vo.Goods;
import com.example.mall.vo.GoodsFile;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HelloController {
	@Autowired
	GoodsService goodsService;
	@Autowired
	GoodsFileService goodsFileService;

	// Author : 오자윤
	// /hello 상품분류 
	@GetMapping("/sortHello")
    public String sortHello(Model model, @RequestParam(value = "orderby", required = false, defaultValue = "menu_order") String orderby) {
        List<Goods> goodsList;
        Integer goodsCount = goodsService.getGoodsCount(); // 전체 상품 수

        if (!"menu_order".equals(orderby)) {
            goodsList = goodsService.getSortedGoods(orderby);
        } else {
            goodsList = goodsService.getAllGoods();
        }

        model.addAttribute("goodsList", goodsList);
        model.addAttribute("goodsCount", goodsCount);
        model.addAttribute("currentOrderby", orderby); // 현재 정렬 기준을 모델에 추가

        Map<Integer, List<GoodsFile>> goodsFileMap = new HashMap<>();
        for (Goods goods : goodsList) {
            List<GoodsFile> goodsFileList = goodsFileService.getGoodsFileListByNo(goods.getGoodsNo());
            goodsFileMap.put(goods.getGoodsNo(), goodsFileList);
        }
        model.addAttribute("goodsFileMap", goodsFileMap);

        return "hello"; //
    }
	
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