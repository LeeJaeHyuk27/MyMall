package com.mall.order.dao;


import org.mybatis.spring.annotation.MapperScan;

import com.mall.table.vo.OrderInfoVO;
import com.mall.table.vo.UserInfoVO;

@MapperScan(basePackages = "com.mall.order.dao")
public interface OrderDao {
	
	// 주문자정보 불러오기
	public UserInfoVO selectOrderInfo(UserInfoVO vo)throws Exception;
	
	// ORDER_NO 설정
	public String selectMaxOrderNo()throws Exception;
	
	// 장바구니 삭제
	public int deleteCartList(OrderInfoVO vo)throws Exception;
	
	// 주문정보 insert
	public int insertOrderInfo(OrderInfoVO vo)throws Exception;
	
	// 주문상품 insert
	public int insertOrderGoods(OrderInfoVO vo)throws Exception;
}
