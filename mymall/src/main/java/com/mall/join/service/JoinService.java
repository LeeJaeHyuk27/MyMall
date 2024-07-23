package com.mall.join.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mall.join.dao.JoinDao;
import com.mall.table.vo.UserInfoVO;

@Service
public class JoinService {

	@Autowired
	JoinDao dao;
	
	public int insertUser(UserInfoVO vo)throws Exception{
		return dao.insertUser(vo);
	}
}
