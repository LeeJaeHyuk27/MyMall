package com.mall.goods.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mall.goods.service.GoodsService;
import com.mall.table.vo.CartInfoVO;
import com.mall.table.vo.GoodsBoardVO;
import com.mall.table.vo.GoodsImgVO;
import com.mall.table.vo.GoodsInfoVO;
import com.mall.table.vo.UserInfoVO;

@Controller	
public class GoodsController {
	
	@Autowired
	GoodsService service;
	
	@RequestMapping("/goods/view")
	public String main(@ModelAttribute GoodsInfoVO vo, Model model) throws Exception {
		
		model.addAttribute("vo", vo); 
		
		return "/goods/goodsinfo";
	}
	
	// 상품 상세정보 불러오기
	@RequestMapping("/goods/getGoodsDetail")
	@ResponseBody
	public GoodsInfoVO getGoodsDetail(@ModelAttribute("GoodsInfoVO") GoodsInfoVO vo)throws Exception{
		
		//상품정보
		vo = service.selectGoodsDetail(vo);
		
		//이미지리스트
		List<GoodsImgVO> list1 = service.selectGoodsImgList(vo);
		vo.setImglist(list1);
		
		//문의
		List<GoodsBoardVO> list2 = service.selectGoodsBoard(vo);
		vo.setBoardlist(list2);
		
		return vo;
	}
	
	// 장바구니에 담기
	@RequestMapping("/goods/putInCart")
	@ResponseBody
	public int putInCart(@ModelAttribute CartInfoVO vo, HttpServletRequest request)throws Exception{
		
		HttpSession session = request.getSession();
		UserInfoVO uservo = (UserInfoVO)session.getAttribute("MallUser");
		vo.setUserId(uservo.getUserId());
		
		int cnt = service.insertCart(vo);
		
		return cnt;
	}
	
	
}
