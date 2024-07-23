package com.mall.goods.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mall.goods.dao.GoodsDao;
import com.mall.table.vo.CartInfoVO;
import com.mall.table.vo.GoodsBoardVO;
import com.mall.table.vo.GoodsImgVO;
import com.mall.table.vo.GoodsInfoVO;

@Service
public class GoodsService {
	
	@Autowired
	GoodsDao dao;
	
	// 상품 상세정보 불러오기
	public GoodsInfoVO selectGoodsDetail(GoodsInfoVO vo)throws Exception{
		return dao.selectGoodsDetail(vo);
	}
	
	// 상품문의 불러오기
	public List<GoodsBoardVO> selectGoodsBoard(GoodsInfoVO vo)throws Exception{
		return dao.selectGoodsBoard(vo);
	}
	
	// 상품이미지 불러오기
	public List<GoodsImgVO> selectGoodsImgList(GoodsInfoVO vo)throws Exception{
		return dao.selectGoodsImgList(vo);
	}
	
	// 장바구니 담기
	public int insertCart(CartInfoVO vo)throws Exception{
		return dao.insertCart(vo);
	}
}
