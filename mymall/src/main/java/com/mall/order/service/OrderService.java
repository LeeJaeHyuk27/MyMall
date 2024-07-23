package com.mall.order.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mall.order.dao.OrderDao;
import com.mall.table.vo.OrderInfoVO;
import com.mall.table.vo.UserInfoVO;

@Service
public class OrderService {
	@Autowired
	OrderDao dao;
	
	// 주문자정보 불러오기
	public UserInfoVO selectOrderInfo(UserInfoVO vo)throws Exception{
		return dao.selectOrderInfo(vo);
	}
	
	// 주문처리
	@Transactional
	public int ordering(OrderInfoVO vo)throws Exception{
		
		String orderNo = dao.selectMaxOrderNo();
		
		vo.setOrderNo(orderNo);
		// 주문정보 insert
		dao.insertOrderInfo(vo);
		// 주문상품 insert
		dao.insertOrderGoods(vo);
		// 장바구니 삭제
		int cnt = dao.deleteCartList(vo);
		
		return cnt; 
	}
	
	
}
