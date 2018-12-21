package com.jhta.cope.dao;

import java.util.Map;

import com.jhta.cope.vo.User;

public interface UserDao {
	public void insertUser(User user);
	public User getUserById(String userId);
	public User getUserByEmail(String userEmail);
	public void insertUserAuth(Map<String, Object> map);
	public void userAuth(Map<String, Object> map);
}
