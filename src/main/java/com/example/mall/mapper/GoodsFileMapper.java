package com.example.mall.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.mall.vo.GoodsFile;

@Mapper
public interface GoodsFileMapper {
	// /admin/addGoodsFile
	Integer insertGoodsFile(GoodsFile goodsFile);
	
	// /admin/goodsOne
	List<GoodsFile> selectGoodsFileListByNo(@Param("goodsNo") Integer goodsNo);
		// 이미지 삭제 removeGoodsFile
	Integer deleteGoodsFile(Integer goodsFileNo);
		// 이미지 삭제 -  파일 이름
	GoodsFile selectGoodsFileOne(Integer goodsFileNo);
}
