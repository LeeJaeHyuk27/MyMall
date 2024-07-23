package com.mall.join.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mall.join.service.JoinService;
import com.mall.table.vo.UserInfoVO;
import com.mall.util.AesUtil;

@Controller
public class JoinController {

	@Autowired
	JoinService service;
	
	@RequestMapping("/join")
	public String join() throws Exception{
		return "/join";
	}
	
	@RequestMapping("/joinProcess")
	@ResponseBody
	public int joinProcess(@ModelAttribute("UserInfoVO")UserInfoVO vo)throws Exception{
		
		String pwd = AesUtil.aesEncode(vo.getUserPwd());
		
		vo.setUserPwd(pwd);
		
		int cnt = service.insertUser(vo);
		
		return cnt;
	}
}
