package com.mall.goods.dao;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import com.mall.table.vo.CartInfoVO;
import com.mall.table.vo.GoodsBoardVO;
import com.mall.table.vo.GoodsImgVO;
import com.mall.table.vo.GoodsInfoVO;

@MapperScan(basePackages = "com.mall.goods.dao")
public interface GoodsDao {
	
	// 상품 상세정보 불러오기
	public GoodsInfoVO selectGoodsDetail(GoodsInfoVO vo)throws Exception;
	
	// 상품문의 불러오기
	public List<GoodsBoardVO> selectGoodsBoard(GoodsInfoVO vo)throws Exception;
	
	// 상품이미지 불러오기
	public List<GoodsImgVO> selectGoodsImgList(GoodsInfoVO vo)throws Exception;
	
	// 장바구니 담기
	public int insertCart(CartInfoVO vo)throws Exception;
}
