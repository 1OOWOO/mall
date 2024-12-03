package com.example.mall.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.mall.service.GoodsCategoryService;
import com.example.mall.service.GoodsFileService;
import com.example.mall.service.GoodsService;
import com.example.mall.vo.Category;
import com.example.mall.vo.Goods;
import com.example.mall.vo.GoodsFile;
import com.example.mall.vo.GoodsForm;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
//Author : 오아림
@Slf4j
@Controller
public class GoodsController {
	@Autowired GoodsService goodsService;
	@Autowired GoodsFileService goodsFileService;
	@Autowired GoodsCategoryService goodsCategoryService;
	
	// /admin/addGoods
	@GetMapping("/admin/addGoods")
	public String addGoods(Model model) {
		List<Category> categoryList = goodsCategoryService.getAllCategory();
		model.addAttribute("categoryList",categoryList);
		
		return "admin/addGoods";
	}
	@PostMapping("/admin/addGoods")
	public String addGoods(HttpSession session,Model model, GoodsForm goodsForm) {
		if(goodsForm.getGoodsFile() != null) {
			log.debug("GoodsFile size : "+goodsForm.getGoodsFile().size());
		}
		
		List<MultipartFile> list = goodsForm.getGoodsFile();
		if(list != null && list.size()!=0) { // 첨부파일 있다면
			for(MultipartFile f : list) { 
				if(!(f.getContentType().equals("image/jpeg") || f.getContentType().equals("image/png"))) {
					model.addAttribute("msg","이미지 파일만 첨부 가능합니다");
					return "admin/addGoods";
				}
			}
		}
		String path = session.getServletContext().getRealPath("/upload/");
		goodsService.addGoods(goodsForm, path);
		
		return "redirect:/admin/goodsList";
	}
	
	// /admin/goodsList
	@GetMapping("/admin/goodsList")
	public String goodsList(Model model
							,@RequestParam(defaultValue="1") Integer currentPage
							,@RequestParam(defaultValue="10") Integer rowPerPage
							,@RequestParam(defaultValue="") String searchGoods) {
		List<Map<String,Object>> result = goodsService.getGoodsList(currentPage, rowPerPage, searchGoods);
		Map<String,Object> resultMap = result.get(0); // list의 첫번째 map 추출
		
		if(!(searchGoods.equals(""))) {
			log.debug("searchGoods: "+searchGoods);
		}
		
	   model.addAttribute("goodsList",resultMap.get("goodsList"));    
	   model.addAttribute("currentPage",currentPage);
	   model.addAttribute("startPagingNum", resultMap.get("startPagingNum"));
	   model.addAttribute("endPagingNum", resultMap.get("endPagingNum"));
		
		return "admin/goodsList";
	}
	
	// /admin/goodsOne
	@GetMapping("/admin/goodsOne")
	public String goodsOne(Model model, @RequestParam Integer goodsNo) {
		Map<String,Object> map = goodsService.getGoodsOne(goodsNo);
		model.addAttribute("go",map); 
		log.debug("goodsNo: "+Integer.toString(goodsNo));
		
		List<GoodsFile> goodsFileList = goodsFileService.getGoodsFileListByNo(goodsNo);
		model.addAttribute("goodsFileList",goodsFileList);
		log.debug("goodsFileList: "+goodsFileList.toString());
		
		List<Category> categoryList = goodsCategoryService.getAllCategory();
		model.addAttribute("categoryList",categoryList);
		
		return "admin/goodsOne";
	}
	
	// /admin/goodsOne - 상품 수정
	@PostMapping("/admin/modifyGoods")
	public String modifyGoods(@RequestParam Integer goodsNo
								,@RequestParam String goodsTitle
					            ,@RequestParam Integer goodsPrice
					            ,@RequestParam String goodsMemo
					            ,@RequestParam String goodsState
					            ,@RequestParam Integer goodsCategoryNo) {
		log.debug("수정 전 goodsNo: "+goodsNo);
		Map<String, Object> goodsMap = new HashMap<>();
		goodsMap.put("goodsNo", goodsNo);
		goodsMap.put("goodsTitle", goodsTitle);
		goodsMap.put("goodsPrice", goodsPrice);
		goodsMap.put("goodsMemo", goodsMemo);
		goodsMap.put("goodsState", goodsState);
		goodsService.modifyGoods(goodsMap);
		log.debug("goodsMap: "+goodsMap);
		
		Map<String, Object> categoryMap = new HashMap<>();
		categoryMap.put("goodsNo", goodsNo);
        categoryMap.put("categoryNo", goodsCategoryNo);
        goodsCategoryService.modifyGoodsCategory(categoryMap);
        log.debug("categoryMap: "+categoryMap);
        
		return "redirect:/admin/goodsOne?goodsNo="+goodsNo; 
	}
	
	// /customer/customerGoodsOne
	@GetMapping("/customer/customerGoodsOne")
	public String getCustomerGoodsOne(Model model, @RequestParam Integer goodsNo) {
		Goods goods = goodsService.getCustomerGoodsOne(goodsNo);
		log.debug("goodsNo: "+goodsNo);
		
		if(goods != null) {
			model.addAttribute("goods",goods);
			log.debug("goods: "+goods.toString());
		}
		
		// 상품의 카테고리 조회
        Category category = goodsCategoryService.getCategoryByGoodsNo(goodsNo);
        model.addAttribute("category", category);
        log.debug("category: " + category);
		
		return "customer/customerGoodsOne";
	}
	
	// /customer/searchGoods
	@GetMapping("/customer/searchGoods")
    public String searchGoods(Model model, @RequestParam Integer categoryNo) {
		// 카테고리 검색 결과 개수
		 Integer goodsCount = goodsService.countGoodsByCategory(categoryNo);
		
        List<Map<String, Object>> goodsList = goodsService.getGoodsByCategory(categoryNo);
        
        String categoryTitle = (String)goodsList.get(0).get("categoryTitle"); // 첫 번째 상품에서 카테고리 제목 추출
        log.debug("categoryTitle: " + categoryTitle);
        
        model.addAttribute("goodsCount", goodsCount);
        model.addAttribute("goodsList", goodsList);
        model.addAttribute("categoryNo", categoryNo);
        model.addAttribute("categoryTitle", categoryTitle);
        
        return "customer/searchGoods";
    }
}
