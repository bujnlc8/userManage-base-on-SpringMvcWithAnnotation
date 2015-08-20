package com.haihuiling.spring.service.impl;

import java.util.List;

import com.haihuiling.spring.entity.Userinfo;

/**
 * 
 * @author haihuiling
 * @date 2015-8-20 上午10:24:33
 */
public interface IUserInfoService {
	public void addUser(Userinfo user);
	public void deleteUser(String[] pks);
	public void modifyUser(Userinfo user);
	public List<Object> getUserInfoList(String userName,String userSex,String userAddress,String userAge);
	public Object  getById(String pk);

}
