package com.jhta.cope.service;

import java.util.Map;

import javax.mail.MessagingException;

import com.jhta.cope.vo.User;

public interface UserService {

	public void insertUser(User user)throws Exception;
	public User getUserById(String userId);
	public User userAuth(Map<String, Object> map);
	
}
