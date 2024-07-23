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

import com.mall.goods.service.CartService;
import com.mall.table.vo.CartInfoVO;
import com.mall.table.vo.UserInfoVO;

@Controller
public class CartController {

	@Autowired
	CartService service;
	
	@RequestMapping("/goods/cart")
	public String cart(@ModelAttribute CartInfoVO vo, Model model) throws Exception{
		
		model.addAttribute("vo", vo);
		
		return "/goods/cart";
	}
	// 장바구니 불러오기
	@RequestMapping("/cart/getCartList")
	@ResponseBody
	public List<CartInfoVO> getCartList(@ModelAttribute CartInfoVO vo, HttpServletRequest request)throws Exception{
		
		HttpSession session = request.getSession();
		UserInfoVO uservo = (UserInfoVO)session.getAttribute("MallUser");
		vo.setUserId(uservo.getUserId());
		
		List<CartInfoVO> list = service.selectCartList(vo);
		
		return list;
	}
	// 장바구니 해당 상품 삭제
	@RequestMapping("/cart/deleteCartList")
	@ResponseBody
	public int deleteCartList(@ModelAttribute("CartInfoVO")CartInfoVO vo, HttpServletRequest request)throws Exception{
		
		HttpSession session = request.getSession();
		UserInfoVO uservo = (UserInfoVO)session.getAttribute("MallUser");
		vo.setUserId(uservo.getUserId());
		
		int cnt = service.deleteCartList(vo);
		
		return cnt;
	}
	
}
