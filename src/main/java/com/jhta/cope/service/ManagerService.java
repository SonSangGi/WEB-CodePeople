package com.jhta.cope.service;

import java.util.List;

import com.jhta.cope.vo.User;

public interface ManagerService {

	//user 관련
	public List<User> getAllUsers() throws Exception;
	public List<User> getUsersByName(String userName) throws Exception;
	public List<User> getUserById(String userId) throws Exception;
	public List<User> getUserByNo(String userNo) throws Exception;
}
