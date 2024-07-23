package com.mall.order.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mall.order.service.OrderService;
import com.mall.table.vo.OrderInfoVO;
import com.mall.table.vo.UserInfoVO;

@Controller
public class OrderController {
	@Autowired
	OrderService service;
	
	@RequestMapping("/order/order")
	public String order()throws Exception{
		return "/order/order";
	}
	// 주문자정보 불러오기
	@RequestMapping("/order/getOrderInfo")
	@ResponseBody
	public UserInfoVO selectOrderInfo(@ModelAttribute("UserInfoVO") UserInfoVO vo, HttpServletRequest request)throws Exception{
		
		HttpSession session = request.getSession();
		UserInfoVO uservo = (UserInfoVO)session.getAttribute("MallUser");
		vo.setUserId(uservo.getUserId());
		
		vo = service.selectOrderInfo(vo);
		
		return vo;
	}
	// 주문하기
	@RequestMapping("/order/ordering")
	@ResponseBody
	public int ordering(@ModelAttribute OrderInfoVO vo, HttpServletRequest request)throws Exception{
		
		HttpSession session = request.getSession();
		UserInfoVO uservo = (UserInfoVO)session.getAttribute("MallUser");
		vo.setUserId(uservo.getUserId());
		
		int c = service.ordering(vo);
		return c;
	}
}
