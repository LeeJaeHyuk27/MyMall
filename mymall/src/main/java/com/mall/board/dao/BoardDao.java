package com.mall.board.dao;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import com.mall.table.vo.BoardInfoVO;

@MapperScan(basePackages = "com.mall.board.dao")
public interface BoardDao {

	// 문의사항 불러오기
	public List<BoardInfoVO> selectBoardList(BoardInfoVO vo)throws Exception;
	
	// 문의사항 상세보기
	public BoardInfoVO selectBoardDetail(BoardInfoVO vo)throws Exception;
	
	// 비밀글 확인
	public BoardInfoVO secretPwdCheck(BoardInfoVO vo)throws Exception;
	
	// 문의사항 작성
	public int insertBoard(BoardInfoVO vo)throws Exception;
}
