package com.haihuiling.spring.dao.realize;

import java.util.List;

import javax.persistence.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.cdc.jpa.dao.CommonDAOImpl;
import com.haihuiling.spring.dao.impl.IUserInfoDAO;
import com.haihuiling.spring.entity.Userinfo;

/**
 * 
 * @author haihuiling
 * @date 2015-8-20 上午9:08:18
 */
@Repository(value = "userInfoDao")
public class UserInfoDAOImpl extends CommonDAOImpl implements IUserInfoDAO {

	@PersistenceContext
	private EntityManager em;
	@Autowired
	private EntityManagerFactory factory;

	/**
	 * 增加人员信息
	 */
	@Transactional
	public void addUser(Userinfo user) {
		// save(user);
		// saveOrUpdate(user);
		// em.persist(user);
		// em.flush()
		em = factory.createEntityManager();
		em.getTransaction().begin();
		em.persist(user);
		em.getTransaction().commit();
	}

	/**
	 * 删除人员信息
	 */
	public void deleteUser(String[] pks) {
		if (null == pks || pks.length == 0) {
			return;
		} else {
			for (String str : pks) {
				em = factory.createEntityManager();
				em.getTransaction().begin();
				em.remove(em.getReference(Userinfo.class, str));
				em.getTransaction().commit();
				// Userinfo userinfo =em.find(Userinfo.class, str);
				// delete(userinfo);
				// deleteById(Userinfo.class, str);
				// em.remove(em.contains(em.getReference(Userinfo.class, str)) ?
				// em.getReference(Userinfo.class, str) :
				// em.merge(em.getReference(Userinfo.class, str)));
			}
		}

	}

	/**
	 * 修改人员信息
	 */
	public void modifyUser(Userinfo user) {
		//em.merge(user);
		//update(user);
		em = factory.createEntityManager();
		em.getTransaction().begin();
		em.merge(user);
		em.getTransaction().commit();

	}

	/**
	 * 根据条件获得人员列表
	 */
	public List<Object> getUserInfoList(String userName, String userSex,
			String userAddress, String userAge) {
		List<Object> listObjects = null;
		StringBuffer sql_query = new StringBuffer(
				"select ui.userid,ui.username,ui.userage,ui.userbirthday,ui.useraddress,ui.usersex,ui.userjob from Userinfo ui ");
		StringBuffer sql_where = new StringBuffer("where 1 = 1");
		if (null != userName && userName != "") {
			sql_where.append(" and ui.username ='" + userName + "'");
		}
		if (null != userSex && userSex != "") {
			sql_where.append(" and ui.usersex = '" + userSex + "'");
		}
		if (null != userAddress && userAddress != "") {
			sql_where
					.append(" and ui.useraddress like '%" + userAddress + "%'");
		}
		if (null != userAge && userAge != "") {
			sql_where.append(" and ui.userage = '" + userAge + "'");
		}
		Query query = em.createQuery(sql_query.append(sql_where).toString());
		listObjects = query.getResultList();
		return listObjects;
	}

	/**
	 * 通过id获得人员信息
	 */
	public Object getById(String pk) {
		return getById(Userinfo.class, pk);
	}

}
