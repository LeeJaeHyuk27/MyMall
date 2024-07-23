package com.mall.goods.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mall.goods.dao.CartDao;
import com.mall.table.vo.CartInfoVO;

@Service
public class CartService {
	
	@Autowired
	CartDao dao;
	
	// 장바구니 불러오기
	public List<CartInfoVO> selectCartList(CartInfoVO vo)throws Exception{
		return dao.selectCartList(vo);
	}
	
	// 장바구니 해당 상품 삭제
	public int deleteCartList(CartInfoVO vo)throws Exception{
		return dao.deleteCartList(vo);
	}
}
