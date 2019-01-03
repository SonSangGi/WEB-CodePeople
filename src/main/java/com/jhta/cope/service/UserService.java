package com.jhta.cope.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import com.jhta.cope.vo.Avatar;
import com.jhta.cope.vo.Badge;
import com.jhta.cope.vo.User;
@Transactional
public interface UserService {

	public void insertUser(User user)throws Exception;
	public void insertUser(User user, String string)throws Exception;
	public void insertAvatar(String userId)throws Exception;
	public List<Badge> notHaveBadge(int userNo);
	public List<Badge> haveBadge(int userNo);
	public User getUserById(String userId);
	public User userAuth(Map<String, Object> map);
	public User getUserByEmail(String userEmail);
	public void insertUserBadge(int userNo,int badgeNo);
	public void updateAvatar(Avatar avatar);
}
