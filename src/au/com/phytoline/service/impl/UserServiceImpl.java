package au.com.phytoline.service.impl;

import java.util.List;

import au.com.phytoline.dao.UserDAO;
import au.com.phytoline.entity.User;
import au.com.phytoline.service.UserService;

public class UserServiceImpl implements UserService {
	UserDAO userDAO;
	
	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	@Override
	public List login(User condition) {
		return userDAO.login(condition);
	}

	@Override
	public void updateLoginDate(User condition) {
		userDAO.updateLoginDate(condition);
	}

	@Override
	public Integer getUserIdByName(String name) {
		return userDAO.getUserIdByName(name);
	}

}
