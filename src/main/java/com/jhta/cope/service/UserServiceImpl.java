package com.jhta.cope.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.cope.dao.UserDao;
import com.jhta.cope.vo.User;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	UserDao userDao;

	@Override
	public void insertUser(User user) {
		userDao.insertUser(user);
		System.out.println(user);
	}
	
	
}
