package com.mall.join.dao;

import org.mybatis.spring.annotation.MapperScan;

import com.mall.table.vo.UserInfoVO;

@MapperScan(basePackages = "com.mall.join.dao")
public interface JoinDao {

	public int insertUser(UserInfoVO vo)throws Exception;
}
