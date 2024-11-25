package com.example.mall.service;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.example.mall.mapper.GoodsFileMapper;
import com.example.mall.vo.GoodsFile;
import com.example.mall.vo.GoodsForm;

@Service
public class GoodsFileService {
	@Autowired GoodsFileMapper goodsFileMapper;
	
	public void addGoodsFile(GoodsForm goodsForm, String path) {
		if(goodsForm.getGoodsFile() != null) {
			// 파일 입력, ActorFile 입력
			List<MultipartFile> list = goodsForm.getGoodsFile();
			for(MultipartFile mf : list) {
				GoodsFile goodsFile = new GoodsFile();
				goodsFile.setGoodsFileNo(goodsForm.getGoodsNo());
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
                    // 물리적 파일 저장 request.getRealPath("/upload")
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
