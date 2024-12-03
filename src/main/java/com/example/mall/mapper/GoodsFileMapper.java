package com.example.mall.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.mall.vo.GoodsFile;

@Mapper
public interface GoodsFileMapper {
	// /admin/addGoodsFile
	Integer insertGoodsFile(GoodsFile goodsFile);
	
	// /admin/goodsList
	List<GoodsFile> selectGoodsFileList();
	
	// /admin/goodsOne
	List<GoodsFile> selectGoodsFileListByNo(@Param("goodsNo") Integer goodsNo);
}
