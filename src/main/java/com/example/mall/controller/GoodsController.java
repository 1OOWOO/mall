package com.example.mall.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.example.mall.service.GoodsService;
import com.example.mall.vo.GoodsForm;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class GoodsController {
	@Autowired GoodsService goodsService;
	
	// /admin/addGoods
	@GetMapping("/admin/addGoods")
	public String addGoods() {
		return "admin/addGoods";
	}
	@PostMapping("/admin/addGoods")
	public String addGoods(Model model, GoodsForm goodsForm) {
		List<MultipartFile> list = goodsForm.getGoodsFile();
		if(list != null && list.size()!=0) { // 첨부파일 있다면
			for(MultipartFile f : list) { 
				
			}
		}
		return "redirect:/admin/goodsList";
	}
	
}
