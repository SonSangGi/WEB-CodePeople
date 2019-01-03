package com.jhta.cope.dao;

import java.util.List;

import com.jhta.cope.vo.User;

public interface ManagerDao {

	//user 관련
	List<User> getAllUser();
	List<User> getUserByName(String userName);
	List<User> getUserById(String userId);
	List<User> getUserByNo(String userNo);
}
