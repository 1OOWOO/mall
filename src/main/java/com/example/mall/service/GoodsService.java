package com.example.mall.service;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.example.mall.mapper.GoodsFileMapper;
import com.example.mall.mapper.GoodsMapper;
import com.example.mall.vo.Goods;
import com.example.mall.vo.GoodsFile;
import com.example.mall.vo.GoodsForm;

@Service
public class GoodsService {
	@Autowired private GoodsMapper goodsMapper;
	@Autowired private GoodsFileMapper goodsFileMapper;
	
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
}
