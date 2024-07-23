package com.mall.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mall.main.service.MainService;
import com.mall.table.vo.CategoryVO;
import com.mall.table.vo.GoodsInfoVO;

@Controller	
public class MainController {
	
	@Autowired
	MainService service;

	@RequestMapping("/")
	public String main() throws Exception {
		return "main";
	}
	
	// 상품이미지 불러오기
	@RequestMapping("/main/getGoodsImage")
	@ResponseBody
	public List<GoodsInfoVO> getGoodsImage(@ModelAttribute GoodsInfoVO vo)throws Exception{
		
		List<GoodsInfoVO> list = service.selectGoodsImage(vo);
		
		return list;
	}
	// 카테고리 대분류 불러오기
	@RequestMapping("/main/getCtLv1")
	@ResponseBody
	public List<CategoryVO> getCtLv1(@ModelAttribute CategoryVO vo)throws Exception{
		
		List<CategoryVO> list = service.selectCtLv1(vo);
		
		return list;
	}
	
	
}
