package com.example.mall.service;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.example.mall.mapper.GoodsFileMapper;
import com.example.mall.vo.GoodsFile;
import com.example.mall.vo.GoodsForm;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class GoodsFileService {
	@Autowired GoodsFileMapper goodsFileMapper;
	
	// /admin/addGoods
	public void addGoodsFile(GoodsForm goodsForm, String path) {
		if(goodsForm.getGoodsFile() != null) {
			// 파일 입력, ActorFile 입력
			List<MultipartFile> list = goodsForm.getGoodsFile();
			for(MultipartFile mf : list) {
				GoodsFile goodsFile = new GoodsFile();
				goodsFile.setGoodsFileNo(goodsForm.getGoodsNo());
				goodsFile.setGoodsNo(goodsForm.getGoodsNo()); // 외래키
				log.debug("goodsNo: "+goodsForm.getGoodsNo());
				
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
                log.debug("파일 업로드 row2:"+Integer.toString(row2));
                if (row2 == 1) { // 물리적 파일 저장 request.getRealPath("/upload")
                    try {
                        mf.transferTo(new File(path + filename + "." + ext));
                    } catch (Exception e) {
                        e.printStackTrace();
                        throw new RuntimeException(); // 예외 발생 시 RuntimeException 발생
                    }
                }
			}
		}
	}
	
	// /admin/goodsList
	public List<GoodsFile> getGoodsFileList(){
		return goodsFileMapper.selectGoodsFileList();
	}
	
	// /admin/goodsOne
	public List<GoodsFile> getGoodsFileListByNo(Integer goodsNo){
		return goodsFileMapper.selectGoodsFileListByNo(goodsNo);
	}
}
