package com.mall.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mall.board.dao.BoardDao;
import com.mall.table.vo.BoardInfoVO;

@Service
public class BoardService {

	@Autowired
	BoardDao dao;
	
	// 문의사항 불러오기
	public List<BoardInfoVO> selectBoardList(BoardInfoVO vo)throws Exception{
		return dao.selectBoardList(vo);
	}
	
	// 문의사항 상세보기
	public BoardInfoVO selectBoardDetail(BoardInfoVO vo)throws Exception{
		return dao.selectBoardDetail(vo);
	}
	
	// 비밀글 확인
	public BoardInfoVO secretPwdCheck(BoardInfoVO vo)throws Exception{
		return dao.secretPwdCheck(vo);
	}
	
	// 문의사항 작성
	public int insertBoard(BoardInfoVO vo)throws Exception{
		return dao.insertBoard(vo);
	}
}
