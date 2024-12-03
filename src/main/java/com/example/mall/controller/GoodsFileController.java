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
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class GoodsFileController {
	@Autowired GoodsFileService goodsFileService;
	
	@GetMapping("/admin/addGoodsFile")
	public String addGoodsFile(Model model,@RequestParam Integer goodsNo) {
		model.addAttribute("goodsNo",goodsNo);
		return "on/addGoodsFile";
	}	
	
	@PostMapping("/admin/addGoodsFile")
	public String addGoodsFile(HttpSession session,Model model,GoodsForm goodsForm,@RequestParam Integer goodsNo) {
		log.debug("goodsForm: "+goodsForm);
		goodsForm.setGoodsNo(goodsNo); // goodsNo를 GoodsForm에 설정
		// 이미지 파일 검사 - 여러 파일 중 하나라도 이미지 파일이 아니면 return
		List<MultipartFile> list = goodsForm.getGoodsFile();
		for(MultipartFile f : list) { // jpeg, png만 가능
			if(!(f.getContentType().equals("image/jpeg") || f.getContentType().equals("image/png"))) {
				model.addAttribute("msg","이미지 파일만 첨부 가능합니다");
				return "admin/goodsOne?goodsNo="+goodsForm.getGoodsNo();
			}
		}
		// upload 파일에 저장
		String path = session.getServletContext().getRealPath("/upload/");
		goodsFileService.addGoodsFile(goodsForm, path);
		return "redirect:/admin/goodsOne?goodsNo="+goodsForm.getGoodsNo();
	}
}
