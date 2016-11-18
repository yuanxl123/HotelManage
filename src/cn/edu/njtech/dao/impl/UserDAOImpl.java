package cn.edu.njtech.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import cn.edu.njtech.dao.IUserDAO;
import cn.edu.njtech.entity.User;

public class UserDAOImpl extends SqlMapClientDaoSupport implements IUserDAO {

	@Override
	public List<User> getUser(User u) throws SQLException {
		// TODO Auto-generated method stub
		return getSqlMapClientTemplate().queryForList("selectUser", u);
	}

}