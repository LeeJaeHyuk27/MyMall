package com.mall.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mall.main.dao.MainDao;
import com.mall.table.vo.CategoryVO;
import com.mall.table.vo.GoodsInfoVO;

@Service
public class MainService {

	@Autowired
	MainDao dao;
	
	// 상품이미지 불러오기
	public List<GoodsInfoVO> selectGoodsImage(GoodsInfoVO vo)throws Exception{
		return dao.selectGoodsImage(vo);
	}
	
	// 카테고리 대분류 불러오기 
	public List<CategoryVO> selectCtLv1(CategoryVO vo)throws Exception{
		return dao.selectCtLv1(vo);
	}
	
	
		
}
