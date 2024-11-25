package com.example.mall.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.mall.service.GoodsFileService;
import com.example.mall.vo.GoodsForm;

import jakarta.servlet.http.HttpSession;

@Controller
public class GoodsFileController {
	@Autowired GoodsFileService goodsFileService;
	
	@GetMapping("/on/addGoodsFile")
	public String addActorFile(Model model,@RequestParam Integer goodsNo) {
		model.addAttribute("goodsNo",goodsNo);
		return "on/addGoodsFile";
	}	
	
	@PostMapping("/on/addGoodsFile")
	public String addActorFile(HttpSession session,Model model,GoodsForm goodsForm) {
		// 이미지 파일 검사 - 여러 파일 중 하나라도 이미지 파일이 아니면 return
		List<MultipartFile> list = goodsForm.getGoodsFile();
		for(MultipartFile f : list) { // *.jpeg, *.png만 가능
			if(!(f.getContentType().equals("image/jpeg") || f.getContentType().equals("image/png"))) {
				model.addAttribute("msg","이미지 파일만 첨부 가능합니다");
				return "on/addGoodsFile";
			}
		}
		// upload 파일에 저장
		String path = session.getServletContext().getRealPath("/upload/");
		goodsFileService.addGoodsFile(goodsForm, path);
		return "redirect:/on/actorOne?goodsNo="+goodsForm.getGoodsNo();
	}
}
