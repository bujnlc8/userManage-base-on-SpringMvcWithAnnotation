package com.haihuiling.spring.service.realize;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.haihuiling.spring.dao.impl.IUserInfoDAO;
import com.haihuiling.spring.entity.Userinfo;
import com.haihuiling.spring.service.impl.IUserInfoService;

@Service(value = "userInfoService")
public class UserInfoServiceImpl implements IUserInfoService {
	@Autowired
	private IUserInfoDAO userInfoDao;

	/**
	 * 增加人员信息
	 */
	public void addUser(Userinfo user) {
		userInfoDao.addUser(user);
	}

	/**
	 * 删除人员信息
	 */
	public void deleteUser(String[] pks) {

		userInfoDao.deleteUser(pks);
	}

	/**
	 * 修改人员信息
	 */
	public void modifyUser(Userinfo user) {
		userInfoDao.modifyUser(user);

	}

	/**
	 * 获取人员信息列表
	 */
	public List<Object> getUserInfoList(String userName, String userSex,
			String userAddress, String userAge) {
		return userInfoDao.getUserInfoList(userName, userSex, userAddress,
				userAge);
	}

	/**
	 * 通过ID获得人员
	 */
	public Object getById(String pk) {
		return userInfoDao.getById(pk);
	}

}
