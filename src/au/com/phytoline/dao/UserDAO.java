package au.com.phytoline.dao;

import java.util.List;

import au.com.phytoline.entity.User;

public interface UserDAO {
	public List login(User condition);
	public void updateLoginDate(User condition);
	public Integer getUserIdByName(String name);
}
