package com.mall.goods.dao;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import com.mall.table.vo.CartInfoVO;

@MapperScan(basePackages = "com.mall.goods.dao")
public interface CartDao {
	
	// 장바구니 불러오기
	public List<CartInfoVO> selectCartList(CartInfoVO vo)throws Exception;
	
	// 장바구니 해당 상품 삭제
	public int deleteCartList(CartInfoVO vo)throws Exception;
}
