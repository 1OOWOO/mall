package com.example.mall.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.example.mall.mapper.GoodsCategoryMapper;
import com.example.mall.mapper.GoodsFileMapper;
import com.example.mall.mapper.GoodsMapper;
import com.example.mall.vo.Goods;
import com.example.mall.vo.GoodsFile;
import com.example.mall.vo.GoodsForm;
//Author : 오아림
@Service
@Transactional
public class GoodsService {
	@Autowired private GoodsMapper goodsMapper;
	@Autowired private GoodsFileMapper goodsFileMapper;
	@Autowired private GoodsCategoryMapper goodsCategoryMapper;
	
	// /admin/goodsList
	public List<Map<String,Object>> getGoodsList(Integer currentPage, Integer rowPerPage, String searchGoods){
		Map<String,Object> paramMap = new HashMap<>();
		int beginRow = (currentPage-1)*rowPerPage;
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("searchGoods", searchGoods);
		
		// 페이징
		Integer startPagingNum = (currentPage-1)/10*10+1; // 첫번째 페이지 넘버
		Integer numPerPage = 10; // 한페이지당 페이징개수 = 10
		Integer endPagingNum = startPagingNum+(numPerPage-1); // 마지막 페이지 넘버
		Integer lastPage = this.getLastPage(rowPerPage);
		if(lastPage < endPagingNum) {
			endPagingNum = lastPage;
		}
		List<Map<String,Object>> goodsList = goodsMapper.selectGoodsList(paramMap);
		Map<String,Object> resultMap = new HashMap<>();
		resultMap.put("startPagingNum", startPagingNum);
		resultMap.put("endPagingNum", endPagingNum);
		resultMap.put("goodsList", goodsList);
		
		List<Map<String,Object>> resultList = new ArrayList<>();
		resultList.add(resultMap);
		
		return resultList;
	}
	
	// goodsList 페이징 - 마지막 페이지
	public Integer getLastPage(Integer rowPerPage) {
		Integer count = goodsMapper.selectGoodsCount();
		int lastPage = count / rowPerPage;
		if(count%rowPerPage != 0) {
			lastPage ++;
		}
		return lastPage;
	}
	
	// /admin/addGoods
	public void addGoods(GoodsForm goodsForm, String path) {
		Goods goods = new Goods();
		// GoodsForm -> Goods
		goods.setGoodsTitle(goodsForm.getGoodsTitle());
		goods.setGoodsMemo(goodsForm.getGoodsMemo());
		goods.setGoodsPrice(goodsForm.getGoodsPrice());
		goods.setGoodsState(goodsForm.getGoodsState());
		
		Integer row = goodsMapper.insertGoods(goods);  // Goods를 데이터베이스에 삽입
		Integer goodsNo = goods.getGoodsNo();
		
		if (goodsForm.getGoodsCategoryNo() != null) {
			Map<String, Object> categoryMap = new HashMap<>();
			categoryMap.put("goodsNo", goodsNo);
	        categoryMap.put("categoryNo", goodsForm.getGoodsCategoryNo());
           goodsCategoryMapper.insertGoodsCategory(categoryMap);
        }
		
		if(row == 1 && goodsForm.getGoodsFile() != null) {
			List<MultipartFile> list = goodsForm.getGoodsFile();
			for (MultipartFile mf : list) {
				GoodsFile goodsFile = new GoodsFile();
				goodsFile.setGoodsFileNo(goodsNo);
				goodsFile.setGoodsFileType(mf.getContentType());
                goodsFile.setGoodsFileSize(String.valueOf(mf.getSize()));
                
             // 파일 이름 및 확장자 처리
                String filename = UUID.randomUUID().toString().replace("-", "");
                goodsFile.setGoodsFileName(filename);
                int dotIdx = mf.getOriginalFilename().lastIndexOf(".");
                String originname = mf.getOriginalFilename().substring(0, dotIdx);
                String ext = mf.getOriginalFilename().substring(dotIdx + 1);
                goodsFile.setGoodsFileOrigin(originname);
                goodsFile.setGoodsFileExt(ext);
                
             // GoodsFile을 데이터베이스에 삽입
                int row2 = goodsFileMapper.insertGoodsFile(goodsFile);
                if (row2 == 1) {
                    // 물리적 파일 저장
                    try {
                        mf.transferTo(new File(path + filename + "." + ext));
                    } catch (Exception e) {
                        e.printStackTrace();
                        // 예외 발생 시 RuntimeException 발생
                        throw new RuntimeException();
                    }
                }
			}
		}
	}
	
	// /admin/goodsOne
	public Map<String,Object> getGoodsOne(Integer goodsNo) {
		return goodsMapper.selectGoodsOne(goodsNo);
	}
	
	// /admin/goodsOne - 상품 수정
	public Integer modifyGoods(Map<String,Object> map){
		return goodsMapper.updateGoods(map);
	}
	
	// /customer/customerGoodsOne
	public Goods getCustomerGoodsOne(Integer goodsNo) {
		return goodsMapper.selectCustomerGoodsOne(goodsNo);
	}
	
	// /hello
	public List<Goods> getAllGoods() {
        return goodsMapper.selectAllGoods();
    }
	
	// /hello - 전체 상품 개수
	public Integer getGoodsCount() {
	    return goodsMapper.selectGoodsCount();
	}
	
	// /customer/searchGoods
	public List<Map<String, Object>> getGoodsByCategory(Integer categoryNo) {
        return goodsMapper.selectGoodsByCategory(categoryNo);
    }
	
}
