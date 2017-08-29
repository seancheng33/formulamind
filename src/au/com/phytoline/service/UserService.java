package au.com.phytoline.service;

import java.util.List;

import au.com.phytoline.entity.User;

public interface UserService {
	public List login(User condition);
	public void updateLoginDate(User condition);
	public Integer getUserIdByName(String name);
}
