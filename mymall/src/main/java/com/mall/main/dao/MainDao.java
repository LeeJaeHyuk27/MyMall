package com.mall.main.dao;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import com.mall.table.vo.CategoryVO;
import com.mall.table.vo.GoodsInfoVO;

@MapperScan(basePackages = "com.mall.main.dao")
public interface MainDao {

	// 상품이미지 불러오기
	public List<GoodsInfoVO> selectGoodsImage(GoodsInfoVO vo)throws Exception;
	
	// 카테고리 대분류 불러오기
	public List<CategoryVO> selectCtLv1(CategoryVO vo)throws Exception;
	
	
		
}
