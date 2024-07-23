package com.mall.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mall.board.service.BoardService;
import com.mall.table.vo.BoardInfoVO;
import com.mall.table.vo.UserInfoVO;
import com.mall.util.AesUtil;

@Controller
public class BoardController {

	@Autowired
	BoardService service;
	
	@RequestMapping("/board")
	public String board() throws Exception{
		return "/board/board";
	}
	// 문의사항 불러오기
	@RequestMapping("/board/getBoardList")
	@ResponseBody
	public List<BoardInfoVO> getBoardList(@ModelAttribute BoardInfoVO vo) throws Exception{
		
		List<BoardInfoVO> list = service.selectBoardList(vo);
		
		return list;
	}
	// 문의사항 상세보기
	@RequestMapping("/board/getBoardDetail")
	@ResponseBody
	public BoardInfoVO getBoardDetail(@ModelAttribute("BoardInfoVO")BoardInfoVO vo)throws Exception{
		
		vo = service.selectBoardDetail(vo);
		
		return vo;
	}
	// 비밀글 확인
	@RequestMapping("/board/secretPwdCheck")
	@ResponseBody
	public BoardInfoVO secretPwdCheck(@ModelAttribute("BoardInfoVO")BoardInfoVO vo)throws Exception{
		
		String pwd = AesUtil.aesEncode(vo.getSecretPwd());
		vo.setSecretPwd(pwd);
		
		vo = service.secretPwdCheck(vo);
		
		return vo;
	}
	// 문의사항 작성
	@RequestMapping("/board/insertBoard")
	@ResponseBody
	public int insertBoard(@ModelAttribute("BoardInfoVO")BoardInfoVO vo, HttpServletRequest request)throws Exception{
		
		String pwd = AesUtil.aesEncode(vo.getSecretPwd());
		vo.setSecretPwd(pwd);
		
		HttpSession session = request.getSession();
		UserInfoVO uservo = (UserInfoVO)session.getAttribute("MallUser");
		vo.setUserId(uservo.getUserId());
		
		int cnt = service.insertBoard(vo);
		
		return cnt;
	}
}
